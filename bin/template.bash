#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Tue May 22 19:35:10 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.8 - #_# #@#220518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
PACKAGER=${PACKAGER:-steelalive}
echo "#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: "${PACKAGER}"
#2#::.. Last edit: - "$(date)" ..::## #_# - VERSION=0.0.0.1 - #_# #@#"$(date -I)"#@# #2#
# vi: ft=sh
#3#::..#####################_"${1}"_#######################..::#3#
"
cat <<"EOF"
script_dir(){ 
local SOURCE DIR
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
echo "$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
}

EOF
