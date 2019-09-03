#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Tue May  8 19:45:23 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.2 - #_# #@#080518#@# #2#
#3#::..#####################_/dot/bin/var_show.sh_#######################..::#3#
var_show() {
	echo 'cat <<END_OF_TEXT' >/tmp/temp.sh
	cat "$1" >>/tmp/temp.sh
	echo 'END_OF_TEXT' >>/tmp/temp.sh
	bash /tmp/temp.sh | cat
	rm /tmp/temp.sh
}
var_show "$@"
