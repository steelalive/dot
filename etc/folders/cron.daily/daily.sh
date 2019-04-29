#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Thu May 24 00:35:19 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.3.4 - #_# #@#240518#@# #2#
#3#::..#####################_/etc/cron.daily/daily.sh_#######################..::#3#
#/bin/mount LABEL=LAST-GA /last || true
#/bin/findmnt /last || exit
return
. /dot/anset.sh
liner
export backup_folder=/last/BACKUP
export counter_file=$backup_folder/counter
count=$(<$counter_file)
day="$(date +%d)"
[[ -e $counter_file ]] || echo $day >$counter_file
((count <= 32)) && echo $day >$counter_file
date >$backup_folder/lastdotbackup.date

if ! ((day == count)); then
	day_folder="${backup_folder}/$count"
	mkdir -p "${day_folder}"
	ANBG "\\n BACKUP in progress...${R} ---  \\n"
	ANY " /dot/bin/rs /dot $last_backup/$rotation echo $((rotation + 1)) > $counter_file command launched!\\n\\n"
	/dot/bin/rs /dot "$day_folder"
	echo $((count + 1)) >$counter_file

	ANBG "FSTRIM in progress...${R}\\n"
	fstrim --all
	ANBG 'All right!'"${R}\\n"
fi
liner
