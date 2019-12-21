#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Thu May 31 07:59:58 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.1.3.2 - #_# #@#310518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
##########################_ALIAS_#############################################
#al is not a cool guy, it's a nerdy ALias file

#If you love havie na lot of tails:
#is_in_path tail && alias tail=multitail
#I won't man every command in linux, go to sleep, have some cocaine and pretend it impress girls when you(I) fuck them softly.
alias -- -='builtin \cd - && lk '
alias ......='builtin \cd ../../../../.. && lk '
alias .....='builtin \cd ../../../.. && lk '
alias ....='builtin \cd ../../.. && lk '
alias ...='builtin \cd ../.. && lk  '
alias ..='builtin \cd .. && lk '
alias mnt=". $dot/bin/mnt "
#When you leave an empty space at the end of an alias, bash compeltion is decided you mean to tab a comletio. A space made after the crime will disappoint bash completion. At least there is a way to make him proud, unlike our respective fathers.
alias ad=". $dot/bin/ad "
alias aikunpack='cd $aik; $aik/unpackimg.sh $aik/recovery.img; recovery_miracle '
alias aikrepack="$aik/repackimg.sh"
alias rmv="command \rm -rfv --one-file-system --preserve-root --dir "
alias cpv="command \cp -av --dereference --strip-trailing-slashes --update --context "
alias cdpkg='command \cd $AURDEST '
alias cdp="builtin \cd -P "
alias cpdot="cp -av $dot/* $dot/.histfile $dot/.dir_colors ./"
alias e='. $dot/bin/e '
alias mvv='mv -v '
alias df='command \df -h '
alias dir='command \dir --color=auto '
alias dmesgerr='dmesg -t -l err,crit,alert,emerg '
alias cpav='command \cp -avu '
alias mvv='command \mv -v '
alias rmrf='command \rm -rvf --preserve-root --one-file-system '
alias ncdu='command \ncdu --color dark '
alias fce='command fc -e nano '
alias fastboot='/ext/opt/platform-tools/fastboot --disable-verity --disable-verification --verbose '
alias hd='command \od -Ax -tx1z -v '
alias gitclone=". $dot/bin/gitclone "
alias git='command \git --no-pager '
alias l="command $dot/bin/lk $LS_OPTIONS -l "
alias lkcat='cat /last/power/rooted-rom/lk.img | adb shell "dd of=/dev/block/by-name/lk"; adb reboot recovery'
alias ll="exa -l@ --group-directories-first 2>dev/null || ls -l"
alias lh="lk -lH "
alias lsl='lk -l '
alias ip="command \ip -c -a -p -d -h "
alias lnr='command \ln -srfv '
alias lolcat="command \lolcat --truecolor "
alias lsdate="command \ls --color=auto -AhHlrt "
alias lssize="command \ls -lhHAr --color=auto  --sort size "
alias lt='command \ls --color=always -alt | head -20 '
alias more='less '
alias most='less '
alias pacr='command pacman -Rcsn '
alias pacs='command pacman -S --needed --noconfirm '
alias reboot='command \systemctl \reboot '
alias suedit='SUDO_EDITOR=kate sudoedit '
alias tree='tree --dirsfirst -pshF -C '
alias udevreload='command \udevadm control --reload-rules; systemctl restart systemd-udevd.service;udevadm control --reload '
alias vnstat="vnstat -i wlan0 "
alias ~='builtin \cd ~; lk '
#if is_in_path pacmatic; then
#	alias pacr='command \pacmatic -Rcsn '
#	alias pacs='command \pacmatic -S --needed --noconfirm '
#	alias pacu='command \pacmatic --force --needed -U *.tar.xz '
#fi
is_in_path htop && alias top=htop

#Copied from some nerd, probably some apple shit. Ask jeeves, maybe he knows.
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"='lwp-request -m $method'
done
unset method

#cw, colrisise word or whatever, is a must-have in any shell. Colors are lively and make your screen look fabulous!
if [[ -e /usr/lib/cw ]]; then
	cd /usr/lib/cw && rm -v ping traceroute netstat mount make lsof iptables ifconfig free env dig df clock configure cw-pipe cw-test.cgi etc figlet host ltrace-color nmap nslookup pmap_dump praliases quota quotastats strace-color syslog tcpdump finger 2>/dev/null
fi

#GRC is the old master
[[ -e /etc/profile.d/grc.bashrc ]] && . /etc/profile.d/grc.bashrc
if GRC="$(command \which grc 2>/dev/null)"; then
	if [ "$TERM" != dumb ] && [ -n "$GRC" ]; then
		for i in as blkid colourify configure df diff dig docker docker-machine du env fdisk findmnt free g++ gas gcc getsebool head id ifconfig ip iptables ld lsblk lsof lspci make mount mtr netstat ping ps semanage tail traceroute traceroute6; do
			unalias "$i" 2>/dev/null
			command -v "$i" &>/dev/null && alias "$i"="$GRC -es --colour=auto $(command -v $i) "
		done
	fi
fi
if unalias du &>/dev/null; then alias du='/usr/bin/grc -es --colour=auto /usr/bin/du --separate-dirs --human-readable --one-file-system '; else alias du='du --separate-dirs --human-readable --one-file-system '; fi
if grep --color=auto bash <<<"$SHELL" &>/dev/null; then
	alias egrep='LANG=C command \egrep --color=auto '
	alias fgrep='LANG=C command \fgrep --color=auto '
	alias grep='LANG=C command \grep --color=auto '
fi
if [[ $HOSTNAME == UBUNTU ]]; then
	alias apti='apt install '
	alias apts='apt search '
	alias aptu='apt update; apt-get upgrade '
fi
alias df="/usr/bin/grc -es --colour=auto df -lhT -x devtmpfs -x tmpfs -x usbfs"
alias pacss="pacman -Ss"
