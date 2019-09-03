#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Tue May  8 22:15:14 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.5 - #_# #@#080518#@# #2#
#3#::..#####################_/dot/bin/beep.sh_#######################..::#3#
if [[ $? == 0 ]]; then
	aplay $dot/bin/final/beats.wav 1>/dev/null
else
	aplay $dot/bin/final/Upsilon.wav 1>dev/null
fi
