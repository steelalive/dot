#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Sat Aug  5 01:46:59 EDT 2017 - by: - steelalive - ..::## #_# - VERSION=0.0.0.2 - #_# #@#050817#@# #2#
#3#::..#####################_/dot/bin/prompt2.sh_#######################..::#3#
function prompt_timer_start() {
	PROMPT_TIMER=${PROMPT_TIMER:-$(date +%s.%3N)}
}

function prompt_svn_stats() {
	local WCROOT=$(svn info --show-item wc-root 2>/dev/null)
	if [ -z "$WCROOT" ]; then
		return
	fi

	local SVN_INFO=$(svn info ${WCROOT} 2>/dev/null)
	local CHECKEDOUTURL=$(echo "${SVN_INFO}" | sed -ne 's#^URL: ##p')
	local REV=$(echo "${SVN_INFO}" | sed -ne 's#^Revision: ##p')
	local ROOTURL=$(echo "${SVN_INFO}" | sed -ne 's#^Repository Root: ##p')
	echo " (\e[32m${CHECKEDOUTURL/$ROOTURL\//}\e[1;30m@\e[0m${REV}) "
}

function prompt_timer_stop() {
	local EXIT="$?"           # MUST come first
	local NOW=$(date +%s.%3N) # should be high up, for accurate measurement

	local ELAPSED=$(bc <<<"$NOW - $PROMPT_TIMER")
	unset PROMPT_TIMER

	local T=${ELAPSED%.*}
	local AFTER_COMMA=${ELAPSED##*.}
	local D=$((T / 60 / 60 / 24))
	local H=$((T / 60 / 60 % 24))
	local M=$((T / 60 % 60))
	local S=$((T % 60))

	local TIMER_SHOW
	[[ $D > 0 ]] && TIMER_SHOW=${TIMER_SHOW}$(printf '%dd ' $D)
	[[ $H > 0 ]] && TIMER_SHOW=${TIMER_SHOW}$(printf '%dh ' $H)
	[[ $M > 0 ]] && TIMER_SHOW=${TIMER_SHOW}$(printf '%dm ' $M)
	TIMER_SHOW=${TIMER_SHOW}$(printf "%d.${AFTER_COMMA}s" $S)

	PS1="\e[0m\n" # begin with a newline
	if [ $EXIT != 0 ]; then
		PS1+="\e[1;31m✘ ${EXIT}" # red x with error status
	else
		PS1+="\e[1;32m✔" # green tick
	fi
	PS1+=" \e[0;93m$(date +%H:%M)" # date, e.g. 17:00

	local PSCHAR="$"
	if [ $(id -u) -eq 0 ]; then
		PS1+=" \e[1;31m\h " # root: red hostname
		PSCHAR="\e[1;31m#\e[0m"
	else
		PS1+=" \e[1;32m\h " # non-root: green hostname
	fi
	PS1+="\e[1;94m\w"               # working directory

	GIT_PS1_SHOWDIRTYSTATE=true     # * unstaged, + staged
	GIT_PS1_SHOWSTASHSTATE=true     # $ stashed
	GIT_PS1_SHOWUNTRACKEDFILES=true # % untracked
	GIT_PS1_SHOWCOLORHINTS=true
	# < behind, > ahead, <> diverged, = same as upstream
	GIT_PS1_SHOWUPSTREAM="auto"
	# git with 2 arguments *sets* PS1 (and uses color coding)
	__git_ps1 "${PS1}\e[0m" "\e[0m"

	# try to append svn
	PS1+=$(prompt_svn_stats)

	PS1+=" \e[0;93m${TIMER_SHOW}" # runtime of last command
	PS1+="\e[0m\n${PSCHAR} "      # prompt in new line
}

trap 'prompt_timer_start' DEBUG
PROMPT_COMMAND=prompt_timer_stop
