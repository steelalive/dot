#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Tue Jun 13 02:47:05 EDT 2017 - by: -  - ..::## #_# - VERSION=0.0.1.3 - #_# #@#130617#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
echo -e "${C}This is BASH ${RED}${BASH_VERSION%.*}${BBLACK}${C}- DISPLAY on ${RED}$DISPLAY${R}"
is_in_path grc && /usr/bin/grc -es --colour=auto date && /usr/bin/grc -es --colour=auto uptime
ANBB "Environment updated successfully!$R\n"
printf "%b" "\x1b]0;$USER@$HOSTNAME $SSH_TTY\007"
#if is_in_path fortune cowsay lolcat; then
#	fortune -s | cowsay -f "$(/bin/ls /usr/share/cows | shuf -n1)" | lolcat -s 64
#else
is_in_path fortune && fortunes
#fi
is_in_path lynx && /bin/lynx -dump http://www.commandlinefu.com/commands/random/plaintext | head -n 4 | tail -n 2 | ca
