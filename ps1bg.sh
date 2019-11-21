#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Sat May 12 19:51:37 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.1.2.3 - #_# #@#120518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
#exec 2>/dev/null
. "$dot/anset.sh" || echo dot not defined
cpu_freq_max="$(lscpu | awk '/CPU max/ { print $4 }')"
export cpu_freq_max="${cpu_freq_max::4}"
export cpu_temp_max='80'
[[ $HOSTNAME == GA ]] && sys_color_options="freq mem load temp" seconds_timer=10 limit_ps1=750
[[ $HOSTNAME == PC ]] && sys_color_options="freq mem load temp" seconds_timer=10 limit_ps1=1000
[[ "$sys_color_options" ]] || sys_color_options="mem load" seconds_timer=10 limit_ps1=500
export sys_color_options="${sys_color_options:-"mem load"}"
export seconds_timer="${seconds_timer:-5}"
export limit_ps1="${limit_ps1:-250}"
export mem_raw="$(awk '/MemTotal:/ {print $2}' /proc/meminfo)"
export mem_total="$((mem_raw / 1024))"
unset mem_raw
export cpu_freq_max cpu_temp_max mem_total
load_cpu() {
	({
		cat /proc/stat
		sleep 10
		cat /proc/stat
	} |
		awk '/^cpu / {usr=$2-usr; sys=$4-sys; idle=$5-idle; iow=$6-iow} END {total=usr+sys+idle+iow; printf "%.f\n", (total-idle)*100/total}' 2>/dev/null) 2>/dev/null 1>>/tmp/loadcpu
}
sys_color() {
	local section SYSLOAD echo_out color
	for section; do
		if [[ $section == test ]]; then
			SYSLOAD="$2"
			echo_out="$2"
		fi
		if [[ $section == freq ]]; then
			local freq
			freq="$(grep 'cpu MHz' /proc/cpuinfo | head -1 | cut -d ' ' -f3 | cut -d '.' -f1)" 2>/dev/null
			SYSLOAD="$((200 * freq / ${cpu_freq_max:-1} % 2 + 100 * freq / cpu_freq_max))" 2>/dev/null
			SYSLOAD="$((SYSLOAD - 20))" 2>/dev/null
			echo_out="${freq}MHz"
		fi
		if [[ $section == mem ]]; then
			#			mem_free="$(($(awk 'FNR==2 {print $4}' <(free -m))))" 2>/dev/null
			#			memload="$((mem_total - mem_free))" 2>/dev/null
			SYSLOAD="$(free -m | awk 'NR==2{printf "%s%s\n%.f\n", $3,$2,$3*100/$2 }' | tail -n1 2>/dev/null)" 2>/dev/null
			#			total="$((mem_free / 1024))" 2>/dev/null
			echo_out="$(free -m | awk 'NR==2{printf "%s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }')" 2>/dev/null
		fi
		if [[ $section == temp ]]; then
			ldtemp="$(sensors 2>/dev/null | awk '/Core\ 0/ {gsub(/\+/,"",$3); gsub(/\..+/,"",$3); print $3}' 2>/dev/null)" 2>/dev/null &&
				SYSLOAD="$((200 * ldtemp / ${cpu_temp_max:-1} % 2 + 100 * ldtemp / ${cpu_temp_max:-1}))" 2>/dev/null
			#[[ $HOSTNAME == PC ]] && temp="$(</sys/devices/virtual/thermal/thermal_zone2/temp)" && ldtemp="${temp:0:2}" && SYSLOAD="$ldtemp"
			export echo_out="$ldtemp°C"
		fi
		if [[ $section == load ]]; then
			SYSLOAD="$(tail -n 1 /tmp/loadcpu)"
			echo_out="LOAD: ${SYSLOAD:-0}%"
		fi
		if [[ $section == count ]]; then
			SYSLOAD="${count_bg}"
			echo_out="PS1=${SYSLOAD}"
		fi
		SYSLOAD="${SYSLOAD:-err}"
		case "$SYSLOAD" in
		err) color="255;0;0merr=$1" ;;
		0) color="0;0;0;48;05;57" ;;
		1) color="155;17;245" ;;
		2) color="162;15;236" ;;
		3) color="170;14;227" ;;
		4) color="178;13;218" ;;
		5) color="185;11;209" ;;
		6) color="193;10;200" ;;
		7) color="201;9;191" ;;
		8) color="208;7;182" ;;
		9) color="216;6;173" ;;
		10) color="224;5;164" ;;
		11) color="231;3;155" ;;
		12) color="239;2;146" ;;
		13) color="247;1;137" ;;
		14) color="255;0;128" ;;
		15) color="235;19;137" ;;
		16) color="215;39;147" ;;
		17) color="196;58;157" ;;
		18) color="176;78;167" ;;
		19) color="156;98;176" ;;
		20) color="137;117;186" ;;
		21) color="117;137;196" ;;
		22) color="98;156;206" ;;
		23) color="78;176;215" ;;
		24) color="58;196;225" ;;
		25) color="39;215;235" ;;
		26) color="19;235;245" ;;
		27) color="0;255;255" ;;
		28) color="0;245;255" ;;
		29) color="0;235;255" ;;
		30) color="0;225;255" ;;
		31) color="0;215;255" ;;
		32) color="0;206;255" ;;
		33) color="0;196;255" ;;
		34) color="0;186;255" ;;
		35) color="0;176;255" ;;
		36) color="0;167;255" ;;
		37) color="0;157;255" ;;
		38) color="0;147;255" ;;
		39) color="0;137;255" ;;
		40) color="0;128;255" ;;
		41) color="0;137;235" ;;
		42) color="0;147;215" ;;
		43) color="0;157;196" ;;
		44) color="0;167;176" ;;
		45) color="0;176;156" ;;
		46) color="0;186;137" ;;
		47) color="0;196;117" ;;
		48) color="0;206;98" ;;
		49) color="0;215;78" ;;
		50) color="0;225;58" ;;
		51) color="0;235;39" ;;
		52) color="0;245;19" ;;
		53) color="0;255;0" ;;
		54) color="19;255;0" ;;
		55) color="39;255;0" ;;
		56) color="58;255;0" ;;
		57) color="78;255;0" ;;
		58) color="98;255;0" ;;
		59) color="117;255;0" ;;
		60) color="137;255;0" ;;
		61) color="156;255;0" ;;
		62) color="176;255;0" ;;
		63) color="196;255;0" ;;
		64) color="215;255;0" ;;
		65) color="235;255;0" ;;
		66) color="255;255;0" ;;
		67) color="255;245;0" ;;
		68) color="255;235;0" ;;
		69) color="255;225;0" ;;
		70) color="255;215;0" ;;
		71) color="255;206;0" ;;
		72) color="255;196;0" ;;
		73) color="255;186;0" ;;
		74) color="255;176;0" ;;
		75) color="255;167;0" ;;
		76) color="255;157;0" ;;
		77) color="255;147;0" ;;
		78) color="255;137;0" ;;
		79) color="255;128;0" ;;
		80) color="255;116;0" ;;
		81) color="255;104;0" ;;
		82) color="255;93;0" ;;
		83) color="255;81;0" ;;
		84) color="255;69;0" ;;
		85) color="255;58;0" ;;
		86) color="255;46;0" ;;
		87) color="255;34;0" ;;
		88) color="255;23;0" ;;
		89) color="255;11;0" ;;
		90) color="255;0;0" ;;
		91) color="0;0;0;48;05;201" ;;
		92) color="0;0;0;48;05;129" ;;
		93) color="0;0;0;48;05;68" ;;
		94) color="0;0;0;48;05;21" ;;
		95) color="0;0;0;48;05;51m\x1b[4" ;;
		96) color="0;0;0;48;05;46m\x1b[4" ;;
		97) color="0;0;0;48;05;226m\x1b[4" ;;
		98) color="0;0;0;48;05;214m\x1b[4" ;;
		99) color="0;0;0;48;05;196m\x1b[4" ;;
		100 | 101) color="0;0;0;48;5;196m\x1b[9" ;;
		*) color="255;255;255" ;;
		esac
		l_sep="\u2768"
		r_sep="\u2769"
		printf "%b" "${R}\x1b[1;38;2;${color}m${l_sep}${echo_out}${r_sep}${R}"
	done
}

touch /tmp/prompt /tmp/loadcpu /tmp/START.1
((UID > 0)) && sudo chmod 777 /tmp/prompt /tmp/loadcpu /tmp/START*.* "$dot" &>/dev/null
ps1_writer() {
	count_bg=0
	while ((count_bg < limit_ps1)); do
		{
			export count_bg=$((count_bg + 1))
			load_cpu &
			sys_color ${sys_color_options} count
			[[ $count_bg -gt $((limit_ps1 - 20)) ]] && echo "1" >/tmp/prompt_restart
		} >/tmp/prompt
		sleep "$seconds_timer"
	done
	return
}
#{ while ((count_bg < limit_ps1)); do
#	{
#		count_bg=$((count_bg + 1))
#		load_cpu &
#		sys_color $sys_color_options
#		[[ $count_bg -gt $((limit_ps1 - 20)) ]] && ANBR "|$count_bg|" && echo "1" >/tmp/prompt_restart
#		[[ $count_bg -lt $((limit_ps1 - 19)) ]] && ANG "|$count_bg|"
#	} >/tmp/prompt

#	if hash pscircle &>/dev/null;then
##		if (( count_bg % 2 ));then
#		pscircle --output=/root/wallpapers/pscircle.png
#	else
#		pscircle --output=/root/wallpapers/pscircle2.png
#	fi
#fi
#	sleep "$seconds_timer"
#done
#}
#ps1_writer
#exec 2>&-
#noharden
