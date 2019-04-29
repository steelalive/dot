#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Sun Mar 25 08:06:33 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.6 - #_# #@#250318#@# #2#
#3#::..#####################_/dot/bin/delay.sh_#######################..::#3#
err "Pausing for ${O}$1${RED} seconds"
for time in $(eval echo "{1..$1}"); do
	err "[$time]${Y}  Working..."
	sleep $time
done
