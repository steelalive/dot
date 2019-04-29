#!/system/bin/sh
# nano: wrapper to set up and run nano from terminal
# osm0sis @ xda-developers

dir="$(
	cd "$(dirname "$0")"
	pwd
)"

if [ "$1" == "--term" ]; then
	term=$2
	shift 2
else
	term=xterm-256color
fi

clear
resize >/dev/null
[[ -e /etc/terminfo ]] && TERMINFO=/etc/terminfo
[[ -e /system/etc/terminfo ]] && TERMINFO=/system/etc/terminfo
[[ -e /sbin/terminfo ]] && TERMINFO=/sbin/terminfo
TERM=$term $dir/nano.bin "$@"
