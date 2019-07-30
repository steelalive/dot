#!/bin/bash
#-*- coding: utf-8 -*-
#2#::.. Last edit: - Thu May 31 07:59:58 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.1.3.2 - #_# #@#310518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
##########################_ALIAS_#############################################
#case $- in
#  *i*) :
#  *) echo "You should dot me in" >&2; echo exit 1
#esac

#is_in_path tail && alias tail=multitail
alias -- -='builtin \cd - && lk '
alias ......='builtin \cd ../../../../.. && lk '
alias .....='builtin \cd ../../../.. && lk '
alias ....='builtin \cd ../../.. && lk '
alias ...='builtin \cd ../.. && lk  '
alias ..='builtin \cd .. && lk '
alias ad=". $dot/bin/ad "
alias rmv="command \rm -rfv --one-file-system --preserve-root --dir "
alias cpv="command \cp -av --dereference --strip-trailing-slashes --update --context "
alias cdpkg='command \cd $AURDEST'
alias cdp="builtin \cd -P"
alias e='. $dot/bin/e'
alias mvv='mv -v '
alias df='command \df -h '
alias dir='command \dir --color=auto '
alias cpav='command \cp -avu  '
alias mvv='command \mv -v '
alias rmrf='command \rm -rvf --preserve-root --one-file-system '
alias ncdu='command \ncdu --color dark '
alias fce='command fc -e nano '
alias hd='command \od -Ax -tx1z -v '
alias gitclone=". $dot/bin/gitclone"
alias git='command \git --no-pager'
alias l="command \ls $LS_OPTIONS "
alias ll="lk -l "
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
alias pacr='command \pacman -Rcsn '
alias pacs='command \pacman -S --needed --noconfirm '
alias reboot='command \systemctl reboot '
alias suedit='SUDO_EDITOR=kate sudoedit '
alias tree='command \tree --dirsfirst -pshF -C '
alias udevreload='udevadm control --reload-rules; systemctl restart systemd-udevd.service;udevadm control --reload '
shfmtw() {
	for script; do is_bash "$script" &>/dev/null && shfmt -w -s -i 0 "$(is_bash "$script")"; done
}
alias vnstat="vnstat -i wlan0 "
alias ~='builtin \cd ~; lk '
#if is_in_path pacmatic; then
#	alias pacr='command \pacmatic -Rcsn '
#	alias pacs='command \pacmatic -S --needed --noconfirm '
#	alias pacu='command \pacmatic --force --needed -U *.tar.xz '
#fi
is_in_path htop && alias top=htop
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"='lwp-request -m $method'
done
unset method
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
alias df="/usr/bin/grc -es --colour=auto /usr/bin/df -h"
alias pacss="pacman -Ss"
