#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Tue Jun 13 02:47:05 EDT 2017 - by: -  - ..::## #_# - VERSION=0.0.1.3 - #_# #@#130617#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
is_in_path neofetch && neofetch >~/.cache/neofetch
printf "%b\n" "${C}This is BASH ${RED}${BASH_VERSION%.*}${BBLACK}${C}- DISPLAY on ${RED}$DISPLAY${R}\n"
is_in_path grc && /usr/bin/grc -es --colour=auto date && /usr/bin/grc -es --colour=auto uptime
ANBG "Environment updated successfully!$R\n"
printf "%b" "\x1b]0;$USER@$HOSTNAME $SSH_TTY\007"
is_in_path fortune && fortunes
is_there ~/.cache/neofetch && cat ~/.cache/neofetch
