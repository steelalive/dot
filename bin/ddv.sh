#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Tue May  8 19:35:40 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.2 - #_# #@#080518#@# #2#
#3#::..#####################_/dot/bin/ddv.sh_#######################..::#3#
ddv() {
	unset input output
	select input in ./*.iso ./*.img; do
		break
	done
	echo
	[[ $input ]] || {
		lk
		read -p "if=" input
	}
	echo
	is_in_path grc && {
		/usr/bin/grc -es --colour=auto blkid
		/usr/bin/grc -es --colour=auto lsblk
	}
	select output in /dev/sd?; do
		break
	done
	test -b $output || return 100
	test -f $input || return 2
	ANORANGE "EXECUTE: dd if=$input of=$output status=progress seek=0 bs=16M  conv=notrunc ?????\n"
	yorn "$@" || return 1
	dd if="$input" of="$output" status=progress seek=0 bs=16M conv=notrunc
}
ddv $@
