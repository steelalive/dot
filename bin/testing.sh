#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Tue Mar 20 13:02:25 UTC 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.7 - #_# #@#200318#@# #2#
#3#::..#####################_/dot/bin/testing.sh_#######################..::#3#
#set -xv

export zero=$0
for command in "dirname $zero" "realpath $zero" "wc -l $zero"; do
	strip="$(sed "s|$zero ||" <<<"$command")"
	ANRED "$strip"'='${LO}"$($command)\n"
done
#set +xv
ANRED "$0"
ANRED 'dirname='$(dirname $0)
realpath $0
readlink $0
print_args() {
	ANRED "\"\$@\"${W}=${G}$*"
	echo
	ANRED "\$0${W}=${G}$0"
	echo
	local count=1 each_arg
	for each_arg; do
		ANRED "arg${count}${W}=${Y}$each_arg"
		echo
		count=$((count + 1))
	done
	if [[ ${FUNCNAME[1]} ]]; then
		ANRED 'FUNCNAME['"@"']'"${W}=${G}${FUNCNAME[*]}"
		echo
	fi
	if [[ ${BASH_SOURCE[1]} ]]; then
		ANRED 'BASH_SOURCE['"*"']'"${W}=${G}${BASH_SOURCE[*]}"
		echo
	fi
	ANR
	echo
}
print_args "$@"
. $0 skip "$@"
#set +xv
