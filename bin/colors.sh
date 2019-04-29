#!/bin/bash
# shellcheck disable=SC2016,SC2059,SC2183,SC2004,SC2007,SC2116,SC2034
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Wed Mar  7 18:56:45 EST 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.6.6 - #_# #@#070318#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ [ Aesthir's Color Functions ] ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
#. "${dot}"/anset.sh
#. "${dot}"/ps1bg.sh
# Normal () { printf '\e[m'"$*"; }                  ; Tblack () { printf '\e[0;30m'"$*"'\e[m'; }
# TNormal () { printf '\e[m'"$*"; }                 ; Tred () { printf '\e[0;31m'"$*"'\e[m'; }
# Bold () { printf '\e[1m'"$*"'\e[m'; }             ; Tgreen () { printf '\e[0;32m'"$*"'\e[m'; }
# TBold () { printf '\e[1m'"$*"'\e[m'; }            ; Tbrown () { printf '\e[0;33m'"$*"'\e[m'; }
# Underline () { printf '\e[4m'"$*"'\e[m'; }        ; Tyellow () { printf '\e[0;33m'"$*"'\e[m'; }
# TUnderline () { printf '\e[4m'"$*"'\e[m'; }       ; Tblue () { printf '\e[0;34m'"$*"'\e[m'; }
# Flash () { printf '\e[5m'"$*"'\e[m'; }            ; Tmagenta () { printf '\e[0;35m'"$*"'\e[m'; }
# TFlash () { printf '\e[5m'"$*"'\e[m'; }           ; Tpurple () { printf '\e[0;35m'"$*"'\e[m'; }
# Invert () { printf '\e[7m'"$*"'\e[m'; }           ; Taqua () { printf '\e[0;36m'"$*"'\e[m'; }
# TInvert () { printf '\e[7m'"$*"'\e[m'; }          ; Tcyan () { printf '\e[0;36m'"$*"'\e[m'; }
# Invisible () { printf '\e[8m'"$*"'\e[m'; }        ; Tgrey () { printf '\e[0;37m'"$*"'\e[m'; }
# TInvisible () { printf '\e[8m'"$*"'\e[m'; }       ; Twhite () { printf '\e[0;37m'"$*"'\e[m'; }
# ## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Bold Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞ Underlined Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
# TblackB () { printf '\e[1;30m'"$*"'\e[m'; }       ; TblackU () { printf '\e[4;30m'"$*"'\e[m'; }
# TgreyB () { printf '\e[1;30m'"$*"'\e[m'; }        ; TredU () { printf '\e[4;31m'"$*"'\e[m'; }
# TredB () { printf '\e[1;31m'"$*"'\e[m'; }         ; TgreenU () { printf '\e[4;32m'"$*"'\e[m'; }
# TgreenB () { printf '\e[1;32m'"$*"'\e[m'; }       ; TbrownU () { printf '\e[4;33m'"$*"'\e[m'; }
# TbrownB () { printf '\e[1;33m'"$*"'\e[m'; }       ; TyellowU () { printf '\e[4;33m'"$*"'\e[m'; }
# TyellowB () { printf '\e[1;33m'"$*"'\e[m'; }      ; TblueU () { printf '\e[4;34m'"$*"'\e[m'; }
# TblueB () { printf '\e[1;34m'"$*"'\e[m'; }        ; TmagentaU () { printf '\e[4;35m'"$*"'\e[m'; }
# TmagentaB () { printf '\e[1;35m'"$*"'\e[m'; }     ; TpurpleU () { printf '\e[4;35m'"$*"'\e[m'; }
# TpurpleB () { printf '\e[1;35m'"$*"'\e[m'; }      ; TaquaU () { printf '\e[4;36m'"$*"'\e[m'; }
# TaquaB () { printf '\e[1;36m'"$*"'\e[m'; }        ; TcyanU () { printf '\e[4;36m'"$*"'\e[m'; }
# TcyanB () { printf '\e[1;36m'"$*"'\e[m'; }        ; TgreyU () { printf '\e[4;37m'"$*"'\e[m'; }
# TwhiteB () { printf '\e[1;37m'"$*"'\e[m'; }       ; TwhiteU () { printf '\e[4;37m'"$*"'\e[m'; }
# ## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Flashing Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Inverted Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
# TblackF () { printf '\e[5;30m'"$*"'\e[m'; }       ; TblackI () { printf '\e[7;40m'"$*"'\e[m'; }
# TredF () { printf '\e[5;31m'"$*"'\e[m'; }         ; TredI () { printf '\e[7;41m'"$*"'\e[m'; }
# TgreenF () { printf '\e[5;32m'"$*"'\e[m'; }       ; TgreenI () { printf '\e[7;42m'"$*"'\e[m'; }
# TbrownF () { printf '\e[5;33m'"$*"'\e[m'; }       ; TbrownI () { printf '\e[7;43m'"$*"'\e[m'; }
# TyellowF () { printf '\e[5;33m'"$*"'\e[m'; }      ; TyellowI () { printf '\e[7;43m'"$*"'\e[m'; }
# TblueF () { printf '\e[5;34m'"$*"'\e[m'; }        ; TblueI () { printf '\e[7;44m'"$*"'\e[m'; }
# TmagentaF () { printf '\e[5;35m'"$*"'\e[m'; }     ; TmagentaI () { printf '\e[7;45m'"$*"'\e[m'; }
# TpurpleF () { printf '\e[5;35m'"$*"'\e[m'; }      ; TpurpleI () { printf '\e[7;45m'"$*"'\e[m'; }
# TaquaF () { printf '\e[5;36m'"$*"'\e[m'; }        ; TaquaI () { printf '\e[7;46m'"$*"'\e[m'; }
# TcyanF () { printf '\e[5;36m'"$*"'\e[m'; }        ; TcyanI () { printf '\e[7;46m'"$*"'\e[m'; }
# TgreyF () { printf '\e[5;37m'"$*"'\e[m'; }        ; TgreyI () { printf '\e[7;47m'"$*"'\e[m'; }
# TwhiteF () { printf '\e[5;37m'"$*"'\e[m'; }       ; TwhiteI () { printf '\e[7;47m'"$*"'\e[m'; }
# ## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Invisible Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞ Plain Text on Color Background ∞∞∞∞∞∞∞∞ ##
# TblackV () { printf '\e[8;30m'"$*"'\e[m'; }       ; Bblack () { printf '\e[m'"$*"'\e[m'; }
# TredV () { printf '\e[8;31m'"$*"'\e[m'; }         ; Bred () { printf '\e[0;41m'"$*"'\e[m'; }
# TgreenV () { printf '\e[8;32m'"$*"'\e[m'; }       ; Bgreen () { printf '\e[0;42m'"$*"'\e[m'; }
# TbrownV () { printf '\e[8;33m'"$*"'\e[m'; }       ; Bbrown () { printf '\e[0;43m'"$*"'\e[m'; }
# TyellowV () { printf '\e[8;33m'"$*"'\e[m'; }      ; Byellow () { printf '\e[0;43m'"$*"'\e[m'; }
# TblueV () { printf '\e[8;34m'"$*"'\e[m'; }        ; Bblue () { printf '\e[0;44m'"$*"'\e[m'; }
# TmagentaV () { printf '\e[8;35m'"$*"'\e[m'; }     ; Bmagenta () { printf '\e[0;45m'"$*"'\e[m'; }
# TpurpleV () { printf '\e[8;35m'"$*"'\e[m'; }      ; Bpurple () { printf '\e[0;45m'"$*"'\e[m'; }
# TaquaV () { printf '\e[8;36m'"$*"'\e[m'; }        ; Baqua () { printf '\e[0;46m'"$*"'\e[m'; }
# TcyanV () { printf '\e[8;36m'"$*"'\e[m'; }        ; Bcyan () { printf '\e[0;46m'"$*"'\e[m'; }
# TgreyV () { printf '\e[8;37m'"$*"'\e[m'; }        ; Bgrey () { printf '\e[0;47m'"$*"'\e[m'; }
# TwhiteV () { printf '\e[8;37m'"$*"'\e[m'; }       ; Bwhite () { printf '\e[0;47m'"$*"'\e[m'; }
# ## ∞∞∞∞∞∞∞∞∞ Bold Text on Color Background ∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞ Underlined Text on Color Background ∞∞∞∞∞ ##
# BblackB () { printf '\e[1;40m'"$*"'\e[m'; }       ; BblackU () { printf '\e[4;40m'"$*"'\e[m'; }
# BredB () { printf '\e[1;41m'"$*"'\e[m'; }         ; BredU () { printf '\e[4;41m'"$*"'\e[m'; }
# BgreenB () { printf '\e[1;42m'"$*"'\e[m'; }       ; BgreenU () { printf '\e[4;42m'"$*"'\e[m'; }
# BbrownB () { printf '\e[1;43m'"$*"'\e[m'; }       ; BbrownU () { printf '\e[4;43m'"$*"'\e[m'; }
# ByellowB () { printf '\e[1;43m'"$*"'\e[m'; }      ; ByellowU () { printf '\e[4;43m'"$*"'\e[m'; }
# BblueB () { printf '\e[1;44m'"$*"'\e[m'; }        ; BblueU () { printf '\e[4;44m'"$*"'\e[m'; }
# BmagentaB () { printf '\e[1;45m'"$*"'\e[m'; }     ; BmagentaU () { printf '\e[4;45m'"$*"'\e[m'; }
# BpurpleB () { printf '\e[1;45m'"$*"'\e[m'; }      ; BpurpleU () { printf '\e[4;45m'"$*"'\e[m'; }
# BaquaB () { printf '\e[1;46m'"$*"'\e[m'; }        ; BaquaU () { printf '\e[4;46m'"$*"'\e[m'; }
# BcyanB () { printf '\e[1;46m'"$*"'\e[m'; }        ; BcyanU () { printf '\e[4;46m'"$*"'\e[m'; }
# BgreyB () { printf '\e[1;47m'"$*"'\e[m'; }        ; BgreyU () { printf '\e[4;47m'"$*"'\e[m'; }
# BwhiteB () { printf '\e[1;47m'"$*"'\e[m'; }       ; BwhiteU () { printf '\e[4;47m'"$*"'\e[m'; }
# ## ∞∞∞∞∞∞∞ Flashing Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞ Inverted Text on Color Background ∞∞∞∞∞∞ ##
# BblackF () { printf '\e[5;40m'"$*"'\e[m'; }       ; BblackI () { printf '\e[7;30m'"$*"'\e[m'; }
# BredF () { printf '\e[5;41m'"$*"'\e[m'; }         ; BredI () { printf '\e[7;31m'"$*"'\e[m'; }
# BgreenF () { printf '\e[5;42m'"$*"'\e[m'; }       ; BgreenI () { printf '\e[7;32m'"$*"'\e[m'; }
# BbrownF () { printf '\e[5;43m'"$*"'\e[m'; }       ; BbrownI () { printf '\e[7;33m'"$*"'\e[m'; }
# ByellowF () { printf '\e[5;43m'"$*"'\e[m'; }      ; ByellowI () { printf '\e[7;33m'"$*"'\e[m'; }
# BblueF () { printf '\e[5;44m'"$*"'\e[m'; }        ; BblueI () { printf '\e[7;34m'"$*"'\e[m'; }
# BmagentaF () { printf '\e[5;45m'"$*"'\e[m'; }     ; BmagentaI () { printf '\e[7;35m'"$*"'\e[m'; }
# BpurpleF () { printf '\e[5;45m'"$*"'\e[m'; }      ; BpurpleI () { printf '\e[7;35m'"$*"'\e[m'; }
# BaquaF () { printf '\e[5;46m'"$*"'\e[m'; }        ; BaquaI () { printf '\e[7;36m'"$*"'\e[m'; }
# BcyanF () { printf '\e[5;46m'"$*"'\e[m'; }        ; BcyanI () { printf '\e[7;36m'"$*"'\e[m'; }
# BgreyF () { printf '\e[5;47m'"$*"'\e[m'; }        ; BgreyI () { printf '\e[7;37m'"$*"'\e[m'; }
# BwhiteF () { printf '\e[5;47m'"$*"'\e[m'; }       ; BwhiteI () { printf '\e[7;37m'"$*"'\e[m'; }
# ## ∞∞∞∞∞∞ Invisible Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Color Code Notes ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
# BblackV () { printf '\e[8;40m'"$*"'\e[m'; }     ## Unless I missed something or made a mistake, I   ##
# BredV () { printf '\e[8;41m'"$*"'\e[m'; }       ## calculate a total of 7681 different color codes, ##
# BgreenV () { printf '\e[8;42m'"$*"'\e[m'; }     ## none of which produce a duplicate result.        ##
# BbrownV () { printf '\e[8;43m'"$*"'\e[m'; }     ##                      These will be fine for now. ##
# ByellowV () { printf '\e[8;43m'"$*"'\e[m'; }
# BblueV () { printf '\e[8;44m'"$*"'\e[m'; }
# BmagentaV () { printf '\e[8;45m'"$*"'\e[m'; }
# BpurpleV () { printf '\e[8;45m'"$*"'\e[m'; }
# BaquaV () { printf '\e[8;46m'"$*"'\e[m'; }
# BcyanV () { printf '\e[8;46m'"$*"'\e[m'; }
# BgreyV () { printf '\e[8;47m'"$*"'\e[m'; }
# BwhiteV () { printf '\e[8;47m'"$*"'\e[m'; }
i=1
while true; do
	sec=$i
	echo -en "$i = \e[01;38;5;$((i++))m""\"\\\033[1;38;5;${sec}m\e[m\"\n"
	if [ $i == 9 ]; then break; fi
done | column -c 180 -s ' '
i=10
while true; do
	sec=$i
	echo -en "$i = \e[01;38;5;$((i++))m""\"\\\033[1;38;5;${sec}m\e[m\"\n"
	if [ $i == 100 ]; then break; fi
done | column -c 180 -s ' '
i=100
while true; do
	sec=$i
	echo -en "$i = \e[01;38;5;$((i++))m""\"\\\033[1;38;5;${sec}m\e[m\"\n"
	if [ $i == 255 ]; then break; fi
done | column -c 180 -s ' '
echo

#for line in {0..5}; do for col in {0..39}; do code=$(( $col * 6 + $line + 16 )); printf $'\e[01;38;05;%dm %03d' $code $code;done; echo ;done
#systest(){ export start=0;export increment=1; for i in {0..101..1}; do export SYSLOAD=$i echo_out="$i ";sys_color test; done; echo; };
#xsystest
#colnum(){	for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i} ";done; }
#colcode(){	for code in {0..255}; do echo -en "\033[01;38;5;${code}m" '\\033[01;38;5;'"$code"m"\e[0m"; done; }
#tputboldlist(){ for i in {1..255}; do echo -n "$(tput bold)""$(tput setaf $i)" color $i;done; };tputboldlist
colors256() {
	local c i j
	printf "Standard 16 colors\n"
	for ((c = 0; c < 17; c++)); do
		printf "|%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
	done
	printf "|\n\n"
	printf "Colors 16 to 231 for 256 colors\n"
	for ((c = 16, i = j = 0; c < 232; c++, i++)); do
		printf "|"
		((i > 5 && (i = 0, ++j))) && printf " |"
		((j > 5 && (j = 0, 1))) && printf "\b \n|"
		printf "%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
	done
	printf "|\n\n"
	printf "Greyscale 232 to 255 for 256 colors\n"
	for ((1; c < 256; c++)); do
		printf "|%s%3d%s" "$(tput setaf "$c")" "$c" "$(tput sgr0)"
	done
	printf "|\n"
}
colors256
useage() {
	printf "\n\e[1;4mAscii Escape Code Helper Utility\e[m\n\n"
	printf "  \e[1mUseage:\e[m colors.sh [-|-b|-f|-bq|-fq|-?|?] [start] [end] [step]\n\n"
	printf "The values for the first parameter may be one of the following:\n\n"
	printf "  \e[1m-\e[m  Will result in the default output.\n"
	printf "  \e[1m-b\e[m This will display the 8 color version of this chart.\n"
	printf "  \e[1m-f\e[m This will display the 256 color version of this chart using foreground colors.\n"
	printf "  \e[1m-q\e[m This will display the 256 color version of this chart without the extra text.\n"
	printf "  \e[1m-bq\e[m    This will display the 8 color version of this chart without the extra text.\n"
	printf "  \e[1m-fq\e[m    This will display the 256 color version of this chart using foreground colors without the
	extra text.\n"
	printf "  \e[1m-?|?\e[m   Displays this help screen.\n"
	printf "\nThe remaining parameters are only used if the first parameter is one of: \e[1m-,-f,q,fq\e[m\n\n"
	printf "  \e[1mstart\e[m  The color index to begin display at.\n"
	printf "  \e[1mend\e[m    The color index to stop display at.\n"
	printf "  \e[1mstart\e[m  The number of indexes to increment color by each iteration.\n\n\n"

}
verbose() {
	if [[ $1 != "-q" && $1 != "-fq" && $1 != "-bq" ]]; then
		printf "\nTo control the display style use \e[1m%s\e[m where \e[1m%s\e[m is:\n" '\e[{$value}[:{$value}]m' '{$value}'
		printf "\n  0 Normal \e[1m1 Bold\e[m \e[2m2 Dim\e[m \e[3m3 ???\e[m \e[4m4 Underlined\e[m \e[5m5 Blink\e[m \e[6m6
		???\e[m \e[7m7 Inverted\e[m \e[8m8 Hidden\e[m\n\n"
		printf "If \e[1m%s\e[m is not provided it will reset the display.\n\n" '{$value}'
	fi
}
eight_color() {
	local fgc bgc vals seq0
	if [ "$1" != "-bq" ]; then
		printf "\n\e[1;4m8 Color Escape Value Pallette\e[m\n\n"
		printf "Color escapes are \e[1m%s\e[m\n" '\e[${value};...;${value}m'
		printf "    Values \e[1m30..37\e[m are \e[1mforeground\e[m colors\n"
		printf "    Values \e[1m40..47\e[m are \e[1mbackground\e[m colors\n\n"
	fi
	for fgc in {30..37}; do
		for bgc in {40..47}; do
			fgc=${fgc#37}
			bgc=${bgc#40}
			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}
			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		printf "\e[0m\n"
	done
}

if [[ $1 == "-b" || $1 == "-bq" ]]; then
	eight_color "$1"
	verbose "$1"
elif [[ $1 == "" || $1 == "-" || $1 == "-f" || $1 == "-q" || $1 == "-fq" ]]; then
	start=${2:-0}
	end=${3:-255}
	step=${4:-1}
	color=$start
	style="48;5;"
	if [[ $1 == "-f" || $1 == "-fq" ]]; then
		style="38;5;"
	fi
	perLine=$((($(tput cols) - 2) / 9))
	if [[ $1 != "-q" && $1 != "-fq" ]]; then
		printf "\n\e[1;4m256 Color Escape Value Pallette\e[0m\n\n"
		printf "    \e[1m%s\e[m for \e[1mbackground\e[m colors\n    \e[1m%s\e[m for \e[1mforeground\e[m colors\n\n"
		'\e[48;5;${value}m' '\e[38;5;${value}m'
	fi
	while [ $color -le $end ]; do
		printf "\e[m \e[${style}${color}m  %3d  \e[m " $color
		((color += step))
		if [ $((((color - start) / step) % perLine)) -eq 0 ]; then
			printf "\n"
		fi
	done
	printf "\e[m\n"
	verbose "$1"
else
	useage
fi
function colorgrid() {
	iter=16
	while [ $iter -lt 52 ]; do
		second=$((iter + 36))
		third=$((second + 36))
		four=$((third + 36))
		five=$((four + 36))
		six=$((five + 36))
		seven=$((six + 36))
		if [ $seven -gt 250 ]; then seven=$((seven - 251)); fi

		echo -en "\033[38;5;$(echo $iter)m█ "
		printf "%03d" $iter
		echo -en "   \033[38;5;$(echo $second)m█ "
		printf "%03d" $second
		echo -en "   \033[38;5;$(echo $third)m█ "
		printf "%03d" $third
		echo -en "   \033[38;5;$(echo $four)m█ "
		printf "%03d" $four
		echo -en "   \033[38;5;$(echo $five)m█ "
		printf "%03d" $five
		echo -en "   \033[38;5;$(echo $six)m█ "
		printf "%03d" $six
		echo -en "   \033[38;5;$(echo $seven)m█ "
		printf "%03d" $seven

		iter=$((iter + 1))
		printf '\r\n'
	done
}
#!/bin/bash

# Tom Hale, 2016. MIT Licence.
# Print out 256 colours, with each number printed in its corresponding colour
# See http://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal/821163#821163

set -eu # Fail on errors or undeclared variables

printable_colours=256

# Return a colour that contrasts with the given colour
# Bash only does integer division, so keep it integral
function contrast_colour() {
	local r g b luminance
	colour="$1"

	if ((colour < 16)); then # Initial 16 ANSI colours
		((colour == 0)) && printf "15" || printf "0"
		return
	fi

	# Greyscale # rgb_R = rgb_G = rgb_B = (number - 232) * 10 + 8
	if ((colour > 231)); then # Greyscale ramp
		((colour < 244)) && printf "15" || printf "0"
		return
	fi

	# All other colours:
	# 6x6x6 colour cube = 16 + 36*R + 6*G + B  # Where RGB are [0..5]
	# See http://stackoverflow.com/a/27165165/5353461

	# r=$(( (colour-16) / 36 ))
	g=$((((colour - 16) % 36) / 6))
	# b=$(( (colour-16) % 6 ))

	# If luminance is bright, print number in black, white otherwise.
	# Green contributes 587/1000 to human perceived luminance - ITU R-REC-BT.601
	((g > 2)) && printf "0" || printf "15"
	return

	# Uncomment the below for more precise luminance calculations

	# # Calculate percieved brightness
	# # See https://www.w3.org/TR/AERT#color-contrast
	# # and http://www.itu.int/rec/R-REC-BT.601
	# # Luminance is in range 0..5000 as each value is 0..5
	# luminance=$(( (r * 299) + (g * 587) + (b * 114) ))
	# (( $luminance > 2500 )) && printf "0" || printf "15"
}

# Print a coloured block with the number of that colour
function print_colour() {
	local colour="$1" contrast
	contrast=$(contrast_colour "$1")
	printf "\e[48;5;%sm" "$colour"                # Start block of colour
	printf "\e[38;5;%sm%3d" "$contrast" "$colour" # In contrast, print number
	printf "\e[0m "                               # Reset colour
}

# Starting at $1, print a run of $2 colours
function print_run() {
	local i
	for ((i = $1; i < $1 + $2 && i < printable_colours; i++)); do
		print_colour "$i"
	done
	printf "  "
}

# Print blocks of colours
function print_blocks() {
	local start="$1" i
	local end="$2" # inclusive
	local block_cols="$3"
	local block_rows="$4"
	local blocks_per_line="$5"
	local block_length=$((block_cols * block_rows))

	# Print sets of blocks
	for ((i = start; i <= end; i += (blocks_per_line - 1) * block_length)); do
		printf "\n" # Space before each set of blocks
		# For each block row
		for ((row = 0; row < block_rows; row++)); do
			# Print block columns for all blocks on the line
			for ((block = 0; block < blocks_per_line; block++)); do
				print_run $((i + (block * block_length))) "$block_cols"
			done
			((i += block_cols)) # Prepare to print the next row
			printf "\n"
		done
	done
}

print_run 0 16 # The first 16 colours are spread over the whole spectrum
printf "\n"
print_blocks 16 231 6 6 3   # 6x6x6 colour cube between 16 and 231 inclusive
print_blocks 232 255 12 2 1 # Not 50, but 24 Shades of Grey
#for numeric in {0..103};do echo -en $(sys_color test $numeric);done
#sys_color test err
"${dot}"/anset.sh h
