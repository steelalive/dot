#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Mon Jun  5 14:41:17 EDT 2017 - by: -  - ..::## #_# - VERSION=0.0.0.6 - #_# #@#050617#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
print_proc() {
	pid=$1
	file=$2
	if [ -e "/proc/$pid/$file" ]; then
		echo "/proc/$pid/$file"
		cat "/proc/$pid/$file"
		echo
	else
		echo "Cannot open /proc/$pid/$file"
	fi
}
print_proc_error() {
	pid=$1
	echo
	echo "/proc/$pid"
	ls -la "/proc/$pid"
	echo
	echo "/proc/$pid/fd"
	ls -la "/proc/$pid/fd"
	echo
	print_proc $pid "cmdline"
	print_proc $pid "environ"
	print_proc $pid "io"
	print_proc $pid "limits"
	print_proc $pid "stat"
	print_proc $pid "statm"
	print_proc $pid "status"
	print_proc $pid "maps"
}

name=$1
num=$2
cnt_run=$(pgrep "$name" | wc -l)
if [[ $cnt_run -gt 2 ]]; then
	for lpid in $(pgrep "$name"); do
		if [[ $num != "" ]]; then
			if [[ -e "/proc/$lpid" ]]; then
				exists=$(find "/proc/$lpid" -cmin +$num -name cmdline)
				if [[ $exists != "" ]]; then
					echo "Job being killed due to being around longer then set time of $num minutes"
					print_proc_error $lpid
					kill -9 $lpid
				fi
			fi
		fi
	done
	exit 0
fi
