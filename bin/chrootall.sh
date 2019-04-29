#-*- coding: utf-8 -*-
#2#::.. Last edit: - Fri Feb 16 13:38:13 EST 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.0.7 - #_# #@#160218#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
# Author: #
die() {
	error "$@"
	exit 1
}
((EUID == 0)) || die 'This script must be run with root privileges'
[[ "$1" ]] && place="$1/"
for folder in proc sys dev run tmp; do
	mkdir -p "$place$folder"
done
mount -v -o rbind /proc "${place}proc"
mount -v -o rbind /sys "${place}sys"
mount -v -o rbind /dev "${place}dev"
mount -v -o rbind /run "${place}run"
mount -v -o rbind /tmp "${place}tmp"
exit


mount proc "${place}proc" -t proc -o nosuid,noexec,nodev
mount sys "${place}sys" -t sysfs -o nosuid,noexec,nodev,ro
mount udev "${place}dev" -t devtmpfs -o mode=0755,nosuid
[[ -e dev/block ]] || mount -o rbind /dev "${place}dev"
mkdir "${place}dev/pts" "${place}dev/shm"
mount devpts "${place}dev/pts" -t devpts -o mode=0620,gid=5,nosuid,noexec
mount shm "${place}dev/shm" -t tmpfs -o mode=1777,nosuid,nodev
mount run "${place}run" -t tmpfs -o nosuid,nodev,mode=0755
mount tmp "${place}tmp" -t tmpfs -o mode=1777,strictatime,nodev,nosuid

#for i in sys proc dev run
#[[ -e /$i ]] || continue
#mount -o rbind /$i $i
#fi
