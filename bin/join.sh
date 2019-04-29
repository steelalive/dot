#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Sun Jun 25 01:34:38 EDT 2017 - by: - steelalive - ..::## #_# - VERSION=0.0.0.2 - #_# #@#250617#@# #2#
#3#::..#####################_/dot/bin/join.sh_#######################..::#3#
# Join
# ----------------------------------------------
# This function joins items together with a user specified separator
# Taken whole cloth from: http://stackoverflow.com/questions/1527049/bash-join-elements-of-an-array
#
# Usage:
#   join , a "b c" d #a,b c,d
#   join / var local tmp #var/local/tmp
#   join , "${FOO[@]}" #a,b,c
# ----------------------------------------------
IFS="${1}"
shift
echo "${*}"
