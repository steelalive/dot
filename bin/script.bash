#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Wed Jun 22 01:57:06 EDT 2016 - by: - __INDNYALL__ - ..::## #_# - VERSION=0.0.2.8 - #_# #@#220616#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
#parent_path="$(realpath "${BASH_SOURCE[0]}")"
#parent_name="$(ps -o comm= $PPID)"
#ANG 'parent_path='"$(realpath "${BASH_SOURCE[0]}")"
#ANG 'parent_name='"$(ps -o comm= $PPID)"
#set -o pipefail
#set -o errexit
#set -o pipefail
#set -o nounset
# set -o xtrace
#set
if [[ $script ]]; then
	__file=$(readlink -f "$0")
	__dir=$(dirname "$__file")
	__base="$(basename ${__file} .sh)"
	__root="$(cd "$(dirname "${__dir}")" && pwd)"
	echo -e "${G}Bash script: ${W}\$0:${C}$0 ${W}__dir:${C}${__dir} ${W}__file:${C}${__file} ${W}__base:${C}${__base} ${W}__root:${C}${__root}"
	count=0
	for i; do
		echo -en "${G}SRC:  ${O}arg${count}"'='"${Y}${i} ${W}- "
		((count++))
	done
	echo ""
	eval "$(
		count=0
		for i; do
			((count++))
			echo -n "arg${count}"'='
			echo \${arg$count:-\$${count}}
		done
	)"
	count=0
	for i; do
		echo -en "${RED}EVAL: ${O}arg${count}"'='"${Y}${i} ${W}- "
		((count++))
	done
	echo -e ${RES}
	set -xv
	#################################################
	if [[ $debug ]]; then
		color_def="~/.colorrc"

		if [[ -f $color_def ]]; then
			. $color_def
		else
			# color definitions
			black="$(tput setaf 0)"
			darkgrey="$(
				tput bold
				tput setaf 0
			)"
			lightgrey="$(tput setaf 7)"
			white="$(
				tput bold
				tput setaf 7
			)"
			red="$(tput setaf 1)"
			lightred="$(
				tput bold
				tput setaf 1
			)"
			green="$(tput setaf 2)"
			lightgreen="$(
				tput bold
				tput setaf 2
			)"
			yellow="$(tput setaf 3)"
			blue="$(tput setaf 4)"
			lightblue="$(
				tput bold
				tput setaf 4
			)"
			purple="$(tput setaf 5)"
			pink="$(
				tput bold
				tput setaf 5
			)"
			cyan="$(tput setaf 6)"
			lightcyan="$(
				tput bold
				tput setaf 6
			)"
			nc="$(tput sgr0)" # no color
		fi
		export darkgrey lightgreywhite red lightred green lightgreen yellow blue
		export lightblue purple pink cyan lightcyan nc
		if [[ ! $level_color ]]; then
			level_color=$cyan
		fi
		if [[ ! $script_color ]]; then
			script_color=$yellow
		fi
		if [[ ! $linenum_color ]]; then
			linenum_color=$red
		fi
		if [[ ! $funcname_color ]]; then
			funcname_color=$green
		fi
		if [[ ! $command_color ]]; then
			command_color=$white
		fi
		export script_color linenum_color funcname_color

		reset_screen() {

			echo $nc
		}
		export -f reset_screen

		usage() {
			cat <<'EOF'

usage: debug [option] script arguments

possilbe options are:
- help|usage: print this screen
- verbose: sets -xv flags
- noexec: sets -xvn flags
- no parameter sets -x flags

EOF
			fmt <<EOF
if the script takes arguments remember to enclose the script and arugments
in ""
EOF

			fmt <<EOF

The script prints the script name, script line number and function name as it
executes the script. The various parts of the script prompt are printed in
color. If the default colors are not suitable than you can set the environment
varialbes script_color linenum_color funcname_color to any of the following
colors: ${darkgrey}darkgrey$nc, ${lightgrey}light grey$nc, ${white}white,
${red}red, ${lightred}light red, ${green}green, ${lightgreen}light green,
${yellow}yellow, ${blue}blue, ${lightblue}light blue, ${purple}purple,
${pink}pink, ${cyan}cyan, ${lightcyan}light cyan$nc.
EOF

			cat <<EOF

default colors are:
${level_color}- shell level color:cyan$nc
${script_color}- script name: yellow$nc
${linenum_color}- line number: red$nc
${funcname_color}- function name: green$nc
${command_color}- command executed: white'$nc
EOF
		}
		export -f usage

		debug_cmd() {
			trap reset_screen INT
			/bin/bash $FLAGS $SCRIPT
		}
		export -f debug_cmd

		if [ $# -gt 0 ]; then
			case "$1" in
			"verbose")
				FLAGS=-xv
				SCRIPT=$2
				;;
			"noexec")
				FLAGS=-xvn
				SCRIPT=$2
				;;
			"help" | "usage")
				usage
				exit 3
				;;
			*)
				FLAGS=-x
				PS4="${level_color}+${script_color}"'(${BASH_SOURCE##*/}:${linenum_color}${LINENO}${script_color}):'" ${funcname_color}"
				export PS4
				SCRIPT=$1
				;;
			esac
			debug_cmd
		else
			usage
		fi

		reset_screen
	fi
fi
## echo ##count=0; for i; do ((count++)); echo -n "arg${count}"'='; echo \${arg$count:-\$${count}};done;
