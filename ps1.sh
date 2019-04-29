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
[[ -e /oem ]] && PS1="${iscolor}[${HOSTNAME}]${DGRAY1}--${WHITE1}>${ENDCOLOR1} "
PS2="${DGRAY1}>>>${WHITE1} ●${ENDCOLOR1} "
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
PS1="\[\e[1m\]\[\e[38;5;9m\][\[$PS1ADD\u\[\e[38;5;106m\]@\[\e[38;5;63m\]\H\[\e[38;5;135m\]\[\e[38;5;9m\]]\[\e[0m\] "
prompt_command() {
	RET
	if [[ $HOSTNAME == PC ]]; then
		local has_job tmp_git
		has_job="$(jobs -l | wc -l)"
		tmp_git=$(git branch --color 2>/dev/null) && echo -en "($tmp_git)"
		((has_job > 0)) && ANLG "❨Jobs: ${has_job}❩"
		[[ $(</tmp/START.1) == 999 ]] || ps1_timer /dev/null >&2
		echo 999 >/tmp/START.1
		[[ -e /tmp/prompt_restart ]] && {
			ANLR 'ps1bg restarted'
			fork /dot/ps1bg.sh
			rm /tmp/prompt_restart
		}
		check_source_files
		meteo
	fi
	printf "%b" "$(</tmp/prompt)"
	show_user
	printf "%b" "${R}\x1b[1;38;5;39m${SSH_CLIENT:0:13}${R}"
	ANLC " '${PWD}'"
	history -a
	history -n
	printf '\n'
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
	return_array=(${PIPESTATUS[@]})
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
	city=$(command curl -s ipinfo.io/city) >/dev/null
	region=$(command curl -s ipinfo.io/region) >/dev/null
	region=$(echo "$region" | tr -dc '[:upper:]')
	[[ -e /tmp/moon ]] || if [[ $(date +%H) -gt 19 ]]; then
		command curl -s "http://wttr.in/moon"
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
