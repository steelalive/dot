#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Thu May 31 12:34:02 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=1.1.4.5 - #_# #@#310518#@# #2#
#3#::..#####################_MAIN_#######################..::#3# noharden
#e_completion(){ local cur=${COMP_WORDS[COMP_CWORD]};COMPREPLY=( $(compgen -W "$(echo *; cd /dot/bin; echo *)" -- $cur) ); }
complete -f e
unalias ls src h d &>/dev/null
d() {
	unset f lk
	[[ $1 == LK ]] && LK=1 && shift
	[ "$1" = "." ] && ls . && return
	if [[ $# == 0 ]]; then
		cd || return
		ls
		return
	fi
	case "$1" in
	pacaur)
		f="$AURDEST"
		;;
	dot)
		f="$dot"
		;;
	bin)
		[[ -e "$PWD"/bin ]] && f="$PWD/bin"
		[[ -e "$PWD"/bin ]] || f="/bin"
		;;
	etc)
		f="/etc"
		;;
	droid | and*)
		f="/mnt/android"
		;;
	rbin | rootbin | dotbin)
		f="$dot/bin"
		;;
	tmp)
		f="/tmp"
		;;
	misc)
		[[ -e /last/misc-android ]] && f=/last/misc-android
		[[ -e "$ex"/misc-android ]] && f="$ex"/misc-android
		;;
	ex) f="$ex" ;;
	*)
		local CDPATH
		CDPATH="$cdpath"
		;;
	esac
	shopt -s cdable_vars
	if cd "${f:-$1}" &>/dev/null; then
		lk
	else
		candidate="$(ond "$@")"
		[[ -d $candidate ]] || candidate="$(dirname "$candidate")"
		cd "$candidate" &>/dev/null && lk && return 0
		ANR "error\n" && return 1
	fi
}

killjobs() {
	kill -9 %- &>/dev/null
	for i in $(jobs -l | grep -o '[0-9][0-9][0-9][0-9][0-9]') $(jobs -l | grep -o '[0-9][0-9][0-9][0-9]'); do
		kill "$i" &>/dev/null && ANORANGE "Killed ${i}...\n"
		kill -9 "$i" &>/dev/null && ANRED "Killed -9 ${i}...\n"
	done
}

unps() {
	unset PROMPT_COMMAND
	unset PS0 PS1 PS2 PS3
	killall ps1bg.sh &>/dev/null
	killjobs
	PS1='\w\ u@\h\$ '
	echo "PSS{0..3} $PROMPT_COMMAND"
}

exp() {
	if [[ $# -eq 1 ]]; then
		export "${1}"=1
		ANLO "${1}=1"
		printf "\n"
	else
		[[ $# -eq 2 ]] && eval export "$1"="$2" && ANLO "${1}=$2"
		printf "\n"
	fi
}
cdls() {
	builtin cd "$@" || return 2
	lk
}
h() {
	tail -n $((${LINES:-12} - 2)) -s.1 "$HISTFILE" | ca
}
setenv() { export "$1=$2"; }
export -f setenv
lc() { ruby colorls.rb "$@"; }
function ll() { command ls -l --color=always "$@" | awk '
    {
      k=0
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i))
      if (k)
        printf("%0o ",k)
      printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11)
}'; }

ls() {
	$dot/bin/lk "$@"
}
[[ -e /oem ]] && ls() {
	command \busybox ls -AFhHnpQl --color=auto --group-directories-first "$@"
}

ord() { printf "0x%x\n" "'$1"; }

noexit() {
	exit &
	exec /bin/bash -li
}

mkcd() {
	command \mkdir -pv "$@"
	builtin \cd "$1" || return 2
	lk .
}

src() {
	echo
	if ps1bg="$(jobs -l | awk '{print $2}' 2>/dev/null)"; then
		[[ "$ps1bg" ]] && kill "$ps1bg"
	fi
	ANLO "Executing a new shell..."
	printf "\n"
	builtin exec /usr/bin/bash -l -i
}
export -f src
typea() {
	type -a "${@}" | ca
}

command -v sudo &>/dev/null || {
	sudo() { su -s bash -c "$@"; }
	export -f sudo
}

yornq() {
	[[ "$1" ]] && ANG "Default to$LR $1\n"
	ANY "Do you want to ${RED}Quit$W(1)$Y or ${G}Continue$W(0)$Y?$R"
	printf "\n"
	read -s -r -n 1 -r
	case "$REPLY" in
	y | Y | c | C)
		printf "%b" "$BW(0)$BG✔ Resuming... ✔$R"
		printf "\n"
		return 0
		;;
	n | N | q | Q)
		ANW "(1)$BR$UNDER✗ Exiting. ✗$R"
		printf "\n"
		exit 1
		;;
	*)
		[[ $1 == yes ]] && return 0
		[[ $1 == no ]] && exit 1
		ANW "(255)$BR$UNDER✗ Invalid Response. Exiting. ✗$R"
		printf "\n"
		exit 1
		;;
	esac
}
export -f yornq

wch() {
	{
		alias
		declare -f
	} | command which --all --read-alias --read-functions --show-tilde --show-dot "$@" | ca
	if test -f "$(command -v "$@")"; then
		ca "$(command -v "$@")"
	fi
}

setenv() {
	export "$1=$2"
}

stde() {
	cat <<<"$@" 1>&2
	return
}

s1() {
	local color="$1"
	shift
	printf "\x1b[1;38;5;${color}m%s\n" "$@"

}

#title "$(uname -rnsm)"
bashnorc() {
	env -i kernel='/ext/src/kernel/samsung/exynos7420' O=/ext/out OUT_DIR=/ext/out TOP=/ext/src src=/ext/src PS1='\$ ' PATH=/usr/androbin:/usr/bin:/dot/bin:/dot/bin/final HOME=/root USER=root TERMINFO=/etc/terminfo TERM=xterm-256color /bin/bash --noprofile --norc
}
path_default() {
	unset PATH
	export PATH=$(gawk 'BEGIN {print ENVIRON["PATH"]}')
}

path_prepend() {
	[ -z "$PATH" ] && PATH=$(gawk 'BEGIN {print ENVIRON["PATH"]}')
	export PATH="$*:$PATH"
}

path_append() {
	[ -z "$PATH" ] && PATH=$(gawk 'BEGIN {print ENVIRON["PATH"]}')
	export PATH="$PATH:$*"
}

err() {
	EXIT=$?
	printf "${W}${0} : $RED""$*""\\n" >&2
	return $EXIT
}

date_for_filename() {
	date '+%F_%Hh%M'
}
