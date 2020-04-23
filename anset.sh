#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Fri May 25 05:25:22 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.4.2 - #_# #@#250518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
# Author: #
echo_color_names() {
	NAMES=($(for COLOR in $(ANH); do echo $COLOR | cut -d'=' -f1; done))
	echo ${NAMES[@]}
}
unset echo_color_names
export ESC='\x1b['
BOLD="${ESC}"1m DIM="${ESC}"2m UNDER="${ESC}"4m BLINK="${ESC}"5m REVERSE="${ESC}"7m HIDDEN="${ESC}"8m STRIKE="${ESC}"9m PLAIN="${ESC}"0m
ITALIC="${ESC}"3m
BG_CODE='1;48;5;'
FG_CODE='1;38;2;'
BLACK_CODE=';1;38;5;0m'
BG_256='48;2;'
for base_color in \
	"W=${ESC}1;38;5;231m" \
	"BLINK=$BLINK" \
	"BOLD=$BOLD" \
	"DIM=$DIM" \
	"REVERSE=$REVERSE" \
	"STRIKE=$STRIKE" \
	"ITALIC=$ITALIC" \
	"UNDER=$UNDER" \
	"R=${ESC}m" \
	"RES=${ESC}m" \
	"BLACK=${ESC}1;38;5;16m" \
	"BLUEGREEN=${ESC}1;38;5;24m" \
	"DARK=${ESC}1;38;5;243m" \
	"P=$ESC${FG_CODE}255;192;203m" \
	"LP=$ESC${FG_CODE}219;10;91m" \
	"RED=$ESC${FG_CODE}255;0;0m" \
	"LR=$ESC${FG_CODE}255;64;0m" \
	"C=$ESC${FG_CODE}0;255;255m" \
	"LC=$ESC${FG_CODE}127;255;212m" \
	"DB=$ESC${FG_CODE}35;58;119m" \
	"G=$ESC${FG_CODE}0;255;0m" \
	"LG=$ESC${FG_CODE}127;255;0m" \
	"DG=$ESC${FG_CODE}34;139;34m" \
	"B=$ESC${FG_CODE}30;144;255m" \
	"LB=$ESC${FG_CODE}35;107;142m" \
	"M=$ESC${FG_CODE}81;45;168m" \
	"LM=$ESC${FG_CODE}127;0;255m" \
	"ORANGE=$ESC${FG_CODE}255;97;3m" \
	"LO=$ESC${FG_CODE}255;165;0m" \
	"Y=$ESC${FG_CODE}255;223;0m" \
	"LY=$ESC${FG_CODE}238;173;14m" \
	"BB=$ESC${BG_CODE}21m$W" \
	"BC=$ESC${BG_CODE}81$BLACK_CODE" \
	"BP=$ESC${BG_CODE}209$BLACK_CODE" \
	"BG=$ESC${BG_CODE}46$BLACK_CODE" \
	"BM=$ESC${BG_CODE}92m$W" \
	"BS=$ESC${BG_256}41;218;167$BLACK_CODE" \
	"BR=$ESC${BG_CODE}196$BLACK_CODE" \
	"BY=$ESC${BG_256}255;223;0$BLACK_CODE" \
	"BW=$ESC${BG_CODE}231$BLACK_CODE"; do
	export "$base_color"
	#col_array+=($(awk -F'=' '{print $1}' <<< ${base_color}))
	col_fn="$(awk -F'=' '{print $1}' <<<"$base_color")"
	eval "AN$col_fn(){ printf \"%b\" \"\${R}\${$col_fn}\${*}\${R}\"; }; export -f AN$col_fn"
	if [[ $1 == h || $2 == h ]]; then
		printf "%b" "${base_color}AN$col_fn$R "
	fi
	if [[ $1 == n || $2 == n ]]; then
		if [[ $1 == h || $2 == h ]]; then
			printf "%b" "printf \"\${R}\${$col_fn}\"-->"
			AN"$col_fn" "This is a test bro.$R\n"
		fi
		#eval "ANN${col_fn}(){ echo -en \"\${R}\"\"\${$col_fn}\"\"\${*}\"\"\${R}\"; }; export -f ANN${col_fn}"
	fi
done
if [[ $1 == h || $2 == h ]]; then
	printf "\n"
fi
alias ANH='. "${dot}"/anset.sh;${dot}/anset.sh h'
NC="\033[m" # Color Reset
CR="$(echo -ne $'\r')"
LF="$(echo -ne $'\n')"
TAB="$(echo -ne $'\t')"
#ESC="$(echo -ne '\033')"
return 0
