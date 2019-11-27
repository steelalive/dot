#!/bin/bash
# vi: ft=sh: : set noro:
PROMPT_DIRTRIM=20
ENDCOLOR1="\[\e[0m\]"
BLACK1="\[\e[0;30m\]"
BLUE1="\[\e[0;34m\]"
GREEN1="\[\e[0;32m\]"
CYAN1="\[\e[0;36m\]"
RED1="\[\e[0;31m\]"
PURPLE1="\[\e[0;35m\]"
BROWN1="\[\e[0;33m\]"
GREY1="\[\e[0;37m\]"
DGREY1="\[\e[1;30m\]"
YELLOW1="\[\e[1;33m\]"
WHITE1="\[\e[1;37m\]"
B_BLUE1="\[\e[1;34m\]"
B_GREEN1="\[\e[1;32m\]"
B_CYAN1="\[\e[1;36m\]"
B_RED1="\[\e[1;31m\]"
B_PURPLE1="\[\e[1;35m\]"
PS1=
#PS0=
#SSH_TTY=$(tty 2>/dev/null)

date +%s.%N >"/tmp/START.1"
# shellcheck disable=SC2016
PS0='$(date +%s.%N >/tmp/START.1)'
if [[ $(whoami) == root ]]; then
	iscolor=${B_RED1}
else
	iscolor=${B_GREEN1}
fi
if is_pc; then
	hostcolor=${B_BLUE1}
else
	hostcolor=${B_PURPLE1}
fi
PS4="${purple}${lc}+${sc}"'(${BASH_SOURCE##*/}'":${lnc}<"'${LINENO}'">${sc}): ${fc}("'${FUNCNAME[0]}'"): ${darkgrey}["'${SHLVL}'"] ${lightcyan}SUB:"'${BASH_SUBSHELL}'","'$?'"${lightgray}-->"'$#'" "
[[ -e /oem ]] && PS1="${iscolor}[${HOSTNAME}]${DGREY1}--${WHITE1}>${ENDCOLOR1} "
PS2="${DGREY1}>>>${WHITE1} ●${ENDCOLOR1} "
#PS4="\e\[5;36m\]${BASH_SOURCE[0]}:\[\e\[5;132m\]LINE:${LINENO}\[\e[5;64m\]:${FUNCNAME[0]} -\[\e[5;50m\] SHLVL:${SHLVL} \[\e[01;36m\]SUB:${BASH_SUBSHELL}\$(RET)\[\e[m\]\[\e[38;5;231m>\]\[\e[01;16m\]"
#PS1="${iscolor}\u$(tput sgr0)$(tput setaf 2)@$(tput sgr0)$(tput setaf 3)\h:$(tput sgr0)"
#PS1="$(tput setaf 1)#\u$(tput setaf 2)@$(tput setaf 3)\h:$(tput setaf 2)\w$(tput setaf 6)#$(tput setaf 5)~~$(tput setaf 6)\d$(tput setaf 5)~~$(tput setaf 6)\@$(tput setaf 5)~$(tput setaf 2)\t$(tput setaf 5)~HIST:\!~CMD:\#\$\n$(tput sgr0)"

#is_pc && PS1="\[\033[35m\]\[\033[32m\]\$(unbuffer date 2>/dev/null)\[\033[1;37m\]${DGRAY1}: \[\033[1;34m\]\$(command \\\tty 2>/dev/null | command \\\sed -e 's:/dev/::' 2>/dev/null): \[\033[1;36m\]\$(command \\\ls -A -1 2>/dev/null| command \\\wc -l 2>/dev/null | command \\\sed 's: ::g' 2>/dev/null) files \[\033[1;33m\]\$(command \\\ls -lAh 2>/dev/null | command \\\grep -m 1 total 2>/dev/null | command \\\sed 's/total //' 2>/dev/null)b\[\033[0m\] \n\[\033[0m\]"
#PS1+="${iscolor}\u${WHITE1}@${GREY1}${hostcolor}\h${PURPLE1}❯${CYAN1}❯${GREEN1}❯${iscolor} \$${ENDCOLOR1} "
unset ENDCOLOR1 BLACK1 BLUE1 GREEN1 CYAN1 RED1 PURPLE1 BROWN1 GREY1 DGREY1 YELLOW1 WHITE1 B_BLUE1 B_GREEN1 B_CYAN1 B_RED1 B_PURPLE1

if [[ $USER == root ]]; then
	PS1ADD="\[\e[01;31m\]"
else
	PS1ADD="\[\e[0;01m\]"
fi
prompt_command() {
	RET
	set_title " ${HOSTNAME%%.*}:${PWD} CMD:$(fc -rl | head -n1 | cut -d" " -f2-99) "
	if [[ $HOSTNAME == PC ]]; then
		local has_job tmp_git
		has_job="$(jobs -l | wc -l)"
		#		tmp_git=$(git branch --color 2>/dev/null) && printf "%b" "($tmp_git)"
		((has_job > 0)) && ANLG "❨Jobs: ${W}${has_job}${LG}❩${R}"
		[[ $(</tmp/START.1) == 999 ]] || ps1_timer /dev/null >&2
		echo 999 >/tmp/START.1
		[[ -e /tmp/prompt_restart ]] && {
			ANLR 'ps1bg restarted\n'
			fork $dot/ps1bg.sh
			rm /tmp/prompt_restart
		}
		check_source_files
		meteo
	fi
	printf "%b" "$(</tmp/prompt)${R}"
	#	show_user
	printf "%b" "${ORANGE}${SSH_CLIENT:0:13}${R}"
	#	ANLC " '${PWD}'"
	history -a
	history -n
}
touch /tmp/prompt
PROMPT_COMMAND=prompt_command

wifiip() {
	unset ip
	ip="$(command \ip -4 addr show $NET | awk 'NR==2{print $2}')"
	export ip
	if grep 127 <<<"$ip" &>/dev/null; then
		unset ip
	fi
}
wifiip

show_user() {
	[[ $SSH_CLIENT ]] && ANBS "SSH: ${SSH_CLIENT:10:3}"
	if [[ $UID == 0 ]]; then
		ANW "(${RED}*ROOT*${R}"
	else
		[[ $USER ]] && ANG "(${USER}${R}"
		[[ $LOGNAME ]] && ANBG "(${LOGNAME}${R}"
	fi

	if [[ $ip ]]; then
		ANW "@"
		if [[ $HOSTNAME == TV ]]; then
			ANBW "${RED}${HOST}${R}${W})"
		elif [[ $HOSTNAME == G4 ]]; then
			ANBG "${B}${HOST}${R}${W})"
		elif [[ -e /oem ]]; then
			ANBR "*ON ANDROID*${R}${W})"
		else
			ANBB "${C}${HOST}${R}${W})"
		fi
	fi
}
[[ $(</tmp/START.1) ]] || echo 999 >/tmp/START.1
ps1_timer() {
	local time_ps1
	time_ps1=$(awk "BEGIN { printf(\"%f\", $(date +%s.%N) - $(</tmp/START.1)) }" /dev/null)
	ANW "${UNDER}[${time_ps1::4}s]"
}
RET() {
	return_array=("${PIPESTATUS[@]}")
	export return_array
	local return_code
	if { for return_code in "${return_array[@]}"; do [[ ${return_code} == 0 ]]; done; }; then
		ANG '✔'"${R}"
		return 0
	fi
	ANRED "✘ ${W}[${BR}${STRIKE}${return_array[0]}${R}"
	for return_code in "${return_array[@]:1}"; do
		ANW "|${RED}${STRIKE}${return_code}${R}"
	done
	ANW "]${R}"
	return "${return_array[0]}"
}
do_meteo() {
	hash curl &>/dev/null || return 1
	#city=$(command curl -s ipinfo.io/city) >/dev/null
	#region=$(command curl -s ipinfo.io/region) >/dev/null
	#region=$(echo "$region" | tr -dc '[:upper:]')
	city=mont-tremblant
	region=quebec
	[[ -e /tmp/moon ]] || if [[ $(date +%H) -gt 19 ]]; then
		command \curl -s "http://wttr.in/moon"
		touch /tmp/moon
	fi
	time_echo EH
	[[ $city ]] && [[ $region ]] && command curl -s "http://wttr.in/${city},${region}?2?q" | command tail -n -41 | head -27 && return
	curl -s "http://wttr.in/?2?q"
}
git_prompt() {
	local c_reset c_git_clean c_git_dirty
	c_reset='\[\e[0m\]'
	c_git_clean='\[\e[0;32m\]'
	c_git_dirty='\[\e[0;31m\]'
	if ! git rev-parse --git-dir >/dev/null 2>&1; then
		return 0
	fi
	git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
	if git diff --quiet 2>/dev/null >&2; then
		git_color="${c_git_clean}"
	else
		git_color=${c_git_dirty}
	fi
	echo " [$git_color$git_branch${c_reset}]"
}
meteo() {
	local now
	[[ $ip ]] || return
	((COLUMNS > 126)) || return
	[[ ! -e /tmp/timer ]] && do_meteo
	now="$(time_echo)"
	((now += 2))
	[[ $(</tmp/timer) -ge $now ]] && do_meteo
}

check_source_files() {
	for to_rm in ${source_files}; do
		if [[ -e /tmp/$to_rm ]]; then
			rm "/tmp/$to_rm"
			#unset "init_$(sed 's/\..*//' <<<${to_rm})"
			source "$to_rm"
			EXIT=$?
			echo
			. sh_exit $EXIT "$to_rm has been sourced\n"
		fi
		unset to_rm
	done
}

time_echo() {
	local oldh newh h
	oldh="$(date +%H)"
	newh="${oldh##+(0)}"
	h="$newh"
	[[ $h == "" ]] && h=0
	(($# == 0)) && printf "%s" "$h" && printf "\n"
	[[ $1 == EH ]] && printf "%b" "$h" >/tmp/timer
}
if is_android; then
	prompt_command() {
		RET
		[[ $(</tmp/START.1) == 999 ]] || ps1_timer /dev/null >&2
		echo 999 >/tmp/START.1
		printf "%b" "$(</tmp/prompt)"
		show_user
		printf "%b" "${R}\x1b[1;38;5;39m${SSH_CLIENT:0:13}${R}"
		[[ $ANDROID_SOCKET_adbd ]] && printf "%b" "${BW}ADB_CHROOT"
		ANC "(${PWD})"
		history -a
		printf "\n"
	}
	PROMPT_COMMAND=prompt_command
fi
export -f prompt_command

##############################Shell#####################################################
ps1_hist_clean() {
	history -a
	hsttmp=$(mktemp -q /tmp/XXXXXXXX)
	# Reverse the line order of the bash history file.
	# Have awk remove duplicate lines.
	# have grep filter out lines that start with spaces.
	# Switch it back to original order and output to a temp file.
	if [ -f $hsttmp ]; then
		tac $HISTFILE | awk '!x[$0]++' | grep -E '^[^ ]' | tac >$hsttmp && mv $hsttmp $HISTFILE

		# Run this in a background shell to speed things up a tiny bit.
		(chmod 777 $HISTFILE &) 1>/dev/null
	fi
	history -c
	history -r
}
#. /dot/bin/debug verbose /dot/bin/lk &>/dev/null

#PS4+='+(${BASH_SOURCE##*/}:${LINENO}): (${FUNCNAME[0]}): [${SHLVL}], SUB:${BASH_SUBSHELL}, $?--> '
#!/usr/bin/env bash

# Sexy bash prompt by twolfson
# https://github.com/twolfson/sexy-bash-prompt
# Forked from gf3, https://gist.github.com/gf3/306785

# If we are on a colored terminal
if tput setaf 1 &>/dev/null; then
	# Reset the shell from our `if` check
	tput sgr0 &>/dev/null

	# If you would like to customize your colors, use
	# # Attribution: http://linuxtidbits.wordpress.com/2008/08/11/output-color-on-bash-scripts/
	# for i in $(seq 0 $(tput colors)); do
	#   echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
	# done

	# Save common color actions
	sexy_bash_prompt_bold="$(tput bold)"
	sexy_bash_prompt_reset="$(tput sgr0)"

	# If the terminal supports at least 256 colors, write out our 256 color based set
	if [[ "$(tput colors)" -ge 256 ]] &>/dev/null; then
		sexy_bash_prompt_user_color="$sexy_bash_prompt_bold$(tput setaf 27)"        # BOLD BLUE
		sexy_bash_prompt_preposition_color="$sexy_bash_prompt_bold$(tput setaf 7)"  # BOLD WHITE
		sexy_bash_prompt_device_color="$sexy_bash_prompt_bold$(tput setaf 39)"      # BOLD CYAN
		sexy_bash_prompt_dir_color="$sexy_bash_prompt_bold$(tput setaf 76)"         # BOLD GREEN
		sexy_bash_prompt_git_status_color="$sexy_bash_prompt_bold$(tput setaf 154)" # BOLD YELLOW
		sexy_bash_prompt_git_progress_color="$sexy_bash_prompt_bold$(tput setaf 9)" # BOLD RED
	else
		# Otherwise, use colors from our set of 8
		sexy_bash_prompt_user_color="$sexy_bash_prompt_bold$(tput setaf 4)"         # BOLD BLUE
		sexy_bash_prompt_preposition_color="$sexy_bash_prompt_bold$(tput setaf 7)"  # BOLD WHITE
		sexy_bash_prompt_device_color="$sexy_bash_prompt_bold$(tput setaf 6)"       # BOLD CYAN
		sexy_bash_prompt_dir_color="$sexy_bash_prompt_bold$(tput setaf 2)"          # BOLD GREEN
		sexy_bash_prompt_git_status_color="$sexy_bash_prompt_bold$(tput setaf 3)"   # BOLD YELLOW
		sexy_bash_prompt_git_progress_color="$sexy_bash_prompt_bold$(tput setaf 1)" # BOLD RED
	fi

	sexy_bash_prompt_symbol_color="$sexy_bash_prompt_bold" # BOLD

else
	# Otherwise, use ANSI escape sequences for coloring
	# If you would like to customize your colors, use
	# DEV: 30-39 lines up 0-9 from `tput`
	# for i in $(seq 0 109); do
	#   echo -n -e "\033[1;${i}mText$(tput sgr0) "
	#   echo "\033[1;${i}m"
	# done

	sexy_bash_prompt_reset="\033[m"
	sexy_bash_prompt_user_color="\033[1;34m"         # BLUE
	sexy_bash_prompt_preposition_color="\033[1;37m"  # WHITE
	sexy_bash_prompt_device_color="\033[1;36m"       # CYAN
	sexy_bash_prompt_dir_color="\033[1;32m"          # GREEN
	sexy_bash_prompt_git_status_color="\033[1;33m"   # YELLOW
	sexy_bash_prompt_git_progress_color="\033[1;31m" # RED
	sexy_bash_prompt_symbol_color=""                 # NORMAL
fi

# Define the default prompt terminator character '$'
if [[ $UID == 0 ]]; then
	sexy_bash_prompt_symbol="#"
else
	sexy_bash_prompt_symbol='$'
fi

# Apply any color overrides that have been set in the environment
if [[ -n $PROMPT_USER_COLOR ]]; then sexy_bash_prompt_user_color="$PROMPT_USER_COLOR"; fi
if [[ -n $PROMPT_PREPOSITION_COLOR ]]; then sexy_bash_prompt_preposition_color="$PROMPT_PREPOSITION_COLOR"; fi
if [[ -n $PROMPT_DEVICE_COLOR ]]; then sexy_bash_prompt_device_color="$PROMPT_DEVICE_COLOR"; fi
if [[ -n $PROMPT_DIR_COLOR ]]; then sexy_bash_prompt_dir_color="$PROMPT_DIR_COLOR"; fi
if [[ -n $PROMPT_GIT_STATUS_COLOR ]]; then sexy_bash_prompt_git_status_color="$PROMPT_GIT_STATUS_COLOR"; fi
if [[ -n $PROMPT_GIT_PROGRESS_COLOR ]]; then sexy_bash_prompt_git_progress_color="$PROMPT_GIT_PROGRESS_COLOR"; fi
if [[ -n $PROMPT_SYMBOL ]]; then sexy_bash_prompt_symbol="$PROMPT_SYMBOL"; fi
if [[ -n $PROMPT_SYMBOL_COLOR ]]; then sexy_bash_prompt_symbol_color="$PROMPT_SYMBOL_COLOR"; fi

# Set up symbols
sexy_bash_prompt_synced_symbol=""
sexy_bash_prompt_dirty_synced_symbol="*"
sexy_bash_prompt_unpushed_symbol="△"
sexy_bash_prompt_dirty_unpushed_symbol="▲"
sexy_bash_prompt_unpulled_symbol="▽"
sexy_bash_prompt_dirty_unpulled_symbol="▼"
sexy_bash_prompt_unpushed_unpulled_symbol="⬡"
sexy_bash_prompt_dirty_unpushed_unpulled_symbol="⬢"

# Apply symbol overrides that have been set in the environment
# DEV: Working unicode symbols can be determined via the following gist
#   **WARNING: The following gist has 64k lines and may freeze your browser**
#   https://gist.github.com/twolfson/9cc7968eb6ee8b9ad877
if [[ -n $PROMPT_SYNCED_SYMBOL ]]; then sexy_bash_prompt_synced_symbol="$PROMPT_SYNCED_SYMBOL"; fi
if [[ -n $PROMPT_DIRTY_SYNCED_SYMBOL ]]; then sexy_bash_prompt_dirty_synced_symbol="$PROMPT_DIRTY_SYNCED_SYMBOL"; fi
if [[ -n $PROMPT_UNPUSHED_SYMBOL ]]; then sexy_bash_prompt_unpushed_symbol="$PROMPT_UNPUSHED_SYMBOL"; fi
if [[ -n $PROMPT_DIRTY_UNPUSHED_SYMBOL ]]; then sexy_bash_prompt_dirty_unpushed_symbol="$PROMPT_DIRTY_UNPUSHED_SYMBOL"; fi
if [[ -n $PROMPT_UNPULLED_SYMBOL ]]; then sexy_bash_prompt_unpulled_symbol="$PROMPT_UNPULLED_SYMBOL"; fi
if [[ -n $PROMPT_DIRTY_UNPULLED_SYMBOL ]]; then sexy_bash_prompt_dirty_unpulled_symbol="$PROMPT_DIRTY_UNPULLED_SYMBOL"; fi
if [[ -n $PROMPT_UNPUSHED_UNPULLED_SYMBOL ]]; then sexy_bash_prompt_unpushed_unpulled_symbol="$PROMPT_UNPUSHED_UNPULLED_SYMBOL"; fi
if [[ -n $PROMPT_DIRTY_UNPUSHED_UNPULLED_SYMBOL ]]; then sexy_bash_prompt_dirty_unpushed_unpulled_symbol="$PROMPT_DIRTY_UNPUSHED_UNPULLED_SYMBOL"; fi

function sexy_bash_prompt_get_git_branch() {
	# On branches, this will return the branch name
	# On non-branches, (no branch)
	ref="$(git symbolic-ref HEAD 2>/dev/null | sed -e 's/refs\/heads\///')"
	if [[ $ref != "" ]]; then
		echo "$ref"
	else
		echo "(no branch)"
	fi
}

function sexy_bash_prompt_get_git_progress() {
	# Detect in-progress actions (e.g. merge, rebase)
	# https://github.com/git/git/blob/v1.9-rc2/wt-status.c#L1199-L1241
	git_dir="$(git rev-parse --git-dir)"

	# git merge
	if [[ -f "$git_dir/MERGE_HEAD" ]]; then
		echo " [merge]"
	elif [[ -d "$git_dir/rebase-apply" ]]; then
		# git am
		if [[ -f "$git_dir/rebase-apply/applying" ]]; then
			echo " [am]"
		# git rebase
		else
			echo " [rebase]"
		fi
	elif [[ -d "$git_dir/rebase-merge" ]]; then
		# git rebase --interactive/--merge
		echo " [rebase]"
	elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
		# git cherry-pick
		echo " [cherry-pick]"
	fi
	if [[ -f "$git_dir/BISECT_LOG" ]]; then
		# git bisect
		echo " [bisect]"
	fi
	if [[ -f "$git_dir/REVERT_HEAD" ]]; then
		# git revert --no-commit
		echo " [revert]"
	fi
}

sexy_bash_prompt_is_branch1_behind_branch2() {
	# $ git log origin/master..master -1
	# commit 4a633f715caf26f6e9495198f89bba20f3402a32
	# Author: Todd Wolfson <todd@twolfson.com>
	# Date:   Sun Jul 7 22:12:17 2013 -0700
	#
	#     Unsynced commit

	# Find the first log (if any) that is in branch1 but not branch2
	first_log="$(git log $1..$2 -1 2>/dev/null)"

	# Exit with 0 if there is a first log, 1 if there is not
	[[ -n $first_log ]]
}

sexy_bash_prompt_branch_exists() {
	# List remote branches           | # Find our branch and exit with 0 or 1 if found/not found
	git branch --remote 2>/dev/null | grep --quiet "$1"
}

sexy_bash_prompt_parse_git_ahead() {
	# Grab the local and remote branch
	branch="$(sexy_bash_prompt_get_git_branch)"
	remote="$(git config --get "branch.${branch}.remote" || echo -n "origin")"
	remote_branch="$remote/$branch"

	# $ git log origin/master..master
	# commit 4a633f715caf26f6e9495198f89bba20f3402a32
	# Author: Todd Wolfson <todd@twolfson.com>
	# Date:   Sun Jul 7 22:12:17 2013 -0700
	#
	#     Unsynced commit

	# If the remote branch is behind the local branch
	# or it has not been merged into origin (remote branch doesn't exist)
	if (sexy_bash_prompt_is_branch1_behind_branch2 "$remote_branch" "$branch" ||
		! sexy_bash_prompt_branch_exists "$remote_branch"); then
		# echo our character
		echo 1
	fi
}

sexy_bash_prompt_parse_git_behind() {
	# Grab the branch
	branch="$(sexy_bash_prompt_get_git_branch)"
	remote="$(git config --get "branch.${branch}.remote" || echo -n "origin")"
	remote_branch="$remote/$branch"

	# $ git log master..origin/master
	# commit 4a633f715caf26f6e9495198f89bba20f3402a32
	# Author: Todd Wolfson <todd@twolfson.com>
	# Date:   Sun Jul 7 22:12:17 2013 -0700
	#
	#     Unsynced commit

	# If the local branch is behind the remote branch
	if sexy_bash_prompt_is_branch1_behind_branch2 "$branch" "$remote_branch"; then
		# echo our character
		echo 1
	fi
}

function sexy_bash_prompt_parse_git_dirty() {
	# If the git status has *any* changes (e.g. dirty), echo our character
	if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
		echo 1
	fi
}

function sexy_bash_prompt_is_on_git() {
	git rev-parse 2>/dev/null
}

function sexy_bash_prompt_get_git_status() {
	# Grab the git dirty and git behind
	dirty_branch="$(sexy_bash_prompt_parse_git_dirty)"
	branch_ahead="$(sexy_bash_prompt_parse_git_ahead)"
	branch_behind="$(sexy_bash_prompt_parse_git_behind)"

	# Iterate through all the cases and if it matches, then echo
	if [[ $dirty_branch == 1 && $branch_ahead == 1 && $branch_behind == 1 ]]; then
		echo "$sexy_bash_prompt_dirty_unpushed_unpulled_symbol"
	elif [[ $branch_ahead == 1 && $branch_behind == 1 ]]; then
		echo "$sexy_bash_prompt_unpushed_unpulled_symbol"
	elif [[ $dirty_branch == 1 && $branch_ahead == 1 ]]; then
		echo "$sexy_bash_prompt_dirty_unpushed_symbol"
	elif [[ $branch_ahead == 1 ]]; then
		echo "$sexy_bash_prompt_unpushed_symbol"
	elif [[ $dirty_branch == 1 && $branch_behind == 1 ]]; then
		echo "$sexy_bash_prompt_dirty_unpulled_symbol"
	elif [[ $branch_behind == 1 ]]; then
		echo "$sexy_bash_prompt_unpulled_symbol"
	elif [[ $dirty_branch == 1 ]]; then
		echo "$sexy_bash_prompt_dirty_synced_symbol"
	else # clean
		echo "$sexy_bash_prompt_synced_symbol"
	fi
}

sexy_bash_prompt_get_git_info() {
	# Grab the branch
	branch="$(sexy_bash_prompt_get_git_branch)"

	# If there are any branches
	if [[ $branch != "" ]]; then
		# Echo the branch
		output="$branch"

		# Add on the git status
		output="$output$(sexy_bash_prompt_get_git_status)"

		# Echo our output
		echo "$output"
	fi
}

# Define the sexy-bash-prompt
PS1="\[$sexy_bash_prompt_reset\]\
\[$sexy_bash_prompt_user_color\]\u\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_preposition_color\]at\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_device_color\]\h\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_preposition_color\]in\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_dir_color\]\w\[$sexy_bash_prompt_reset\]\
\$( sexy_bash_prompt_is_on_git && \
  echo -n \" \[$sexy_bash_prompt_preposition_color\]on\[$sexy_bash_prompt_reset\] \" && \
  echo -n \"\[$sexy_bash_prompt_git_status_color\]\$(sexy_bash_prompt_get_git_info)\" && \
  echo -n \"\[$sexy_bash_prompt_git_progress_color\]\$(sexy_bash_prompt_get_git_progress)\" && \
  echo -n \"\[$sexy_bash_prompt_reset\]\")\n\
\[$sexy_bash_prompt_symbol_color\]$sexy_bash_prompt_symbol \[$sexy_bash_prompt_reset\]"

set_title() {
	ORIG=$PS1
	TITLE="\e]2;$*\a"
	#PS1=${ORIG}${TITLE}
	PS1=${TITLE}"\[$sexy_bash_prompt_reset\]\
\[$sexy_bash_prompt_user_color\]\u\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_preposition_color\]at\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_device_color\]\h\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_preposition_color\]in\[$sexy_bash_prompt_reset\] \
\[$sexy_bash_prompt_dir_color\]\w\[$sexy_bash_prompt_reset\]\
\$( sexy_bash_prompt_is_on_git && \
  echo -n \" \[$sexy_bash_prompt_preposition_color\]on\[$sexy_bash_prompt_reset\] \" && \
  echo -n \"\[$sexy_bash_prompt_git_status_color\]\$(sexy_bash_prompt_get_git_info)\" && \
  echo -n \"\[$sexy_bash_prompt_git_progress_color\]\$(sexy_bash_prompt_get_git_progress)\" && \
  echo -n \"\[$sexy_bash_prompt_reset\]\")\n\
\[$sexy_bash_prompt_symbol_color\]$sexy_bash_prompt_symbol \[$sexy_bash_prompt_reset\]"

}

printf "\033]0;${HOSTNAME%%.*}:${PWD}\007"
#set_title $(fc -rl | head -n1  | cut -d" " -f2-99)
