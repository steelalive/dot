#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Tue May 22 19:35:10 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.8 - #_# #@#220518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
PACKAGER=${PACKAGER:-steelalive}
echo "#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: ${PACKAGER}
#2#::.. Last edit: - $(date) ..::## #_# - VERSION=0.0.0.1 - #_# #@#$(date -I)#@# #2#
# vi: set noro: ft=sh
#3#::..#####################_${1}_#######################..::#3#

"

#cat << "EOF"
#cmd_pwd=$(pwd) cmd="$0" cmd_dir="$(cd "$(dirname "$CMD")" && pwd -P)"; setx || true; vexec || true
#EOF
