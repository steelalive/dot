[[ -d /oem ]] || return
. /system/etc/rc
remnt
mount /dev/block/mmxblk1p2 /data/lux &>/dev/null
orig_dir="$(pwd)"
lux="$(echo *-*-*-*-*)"
if [[ -e $lux ]]; then 
	export lux
else
{ [[ $HOSTNAME == G4 ]] || [[ -e /init.qcom.rc ]]; } && export lux=/mnt/media_rw/c68dcfb1-c438-4f9f-8109-7ce175ca99a3
fi
[[ $HOSTNAME = TV ]] && lux=/data/lux

export lux
mkdir -p $lux
unalias ls &>/dev/null
unset LD_PRELOAD
export LS_OPTIONS='-ApLFhH --color=auto --group-directories-first'
[[ -e $lux/usr/bin/bash ]] || mount /dev/block/mmcblk1p2 $lux
INIT_DONE=/tmp/INIT_DONE
if [[ ! -e $INIT_DONE ]]; then
	cd $lux
	remnt
	touch $INIT_DONE
	[[ -e /bin/ls ]] || rm /bin/bash
	for dir in root tmp usr bin lib dot var dev run; do
		for prefix in "/" "$lux/"; do
			here="$prefix$dir"
			[[ -e $here ]] || command \mkdir -p "$here"
			command \chmod 755 "$here"
			command \chown 0:2000 "$here"
		done
	done
	remnt
	mkdir -p /root /tmp /usr /bin /lib /dot /var /run /tmp
	mount /tmp -t tmpfs -o mode=1777,strictatime,nodev,nosuid
	mount -o rbind /tmp $lux/tmp
	mount -o rbind /proc $lux/proc
	mount -o rbind /sys $lux/sys
	mount run /run -t tmpfs -o nosuid,nodev,mode=0755
	mount -o rbind /run $lux/run
	mkdir -p /dev/shm
	mount shm "/dev/shm" -t tmpfs -o mode=1777,nosuid,nodevl
	mkdir -p /dev/pts
	mount devpts "/dev/pts" -t devpts -o mode=0620,gid=5,nosuid,noexec
	mount -o rbind /data/dot/root /data/lux/root
	mount -o rbind /dev $lux/dev
	mount -o rbind "$lux/usr" /usr
	mount -o rbind "$lux/usr/bin" /bin
	mount -o rbind "$lux/usr/lib" /lib
	mount -o rbind "$dot" $lux/dot
	mount -o rbind "$dot/root" /root
	mount -o rbind "$lux/var" /var
	mount -o rbind "$dot/root" "$lux/root"
	rm /etc/resolv.conf &>/dev/null
for resolv in /etc/resolv.conf $lux/etc/resolv.conf; do
	rm $resolv
	echo 'nameserver 192.168.0.1
nameserver 8.8.8.8' >$resolv.conf
done
	bash $dot/bin/88
	mkdir -p /data/local/cron/.local/share/nano/
	touch $INIT_DONE
fi
export HOME=$dot/root
[[ -e $HOME ]] || export HOME=/root
export HISTFILE=$dot/root/histfile
( cd $lux; bash $dot/bin/chrootall.sh $lux )
[[ -x /bin/bash ]] && export PATH=$PATH:$lux/usr/bin
hostname $HOSTNAME
for hostname /etc/hostname $lux/etc/hostname;do
	echo $HOSTNAME > $hostname
done
src() {
	bash=$lux/usr/bin/bash
	[[ -x $bash ]] && exec $bash --init-file $dot/init.sh
}
greet
ldsys resize

unlux() {
	export PATH=/system/sbin:/su/xbin:/su/bin:/system/xbin:/sbin:/vendor/bin:/system/bin:/data/local/bin:/data/local/xbin:/nobin:/data/dot/bin:/data/dot/bin/final:/data/dot:/data/lux/usr/bin
	unset LD_LIBRARY_PATH LD_PRELOAD
}

# SSHD begin setup
#mkdir -p /etc/ssh
#if [[ ! -e /etc/ssh/ssh_host_rsa_key ]]; then
#	ssh-keygen -A
#	rm -rf /data/ssh
#	ln -sv /system/etc/ssh /data/
#	$lux/usr/bin/sshd
#	ln -vsf $dot/etc/ssh/sshd_config /data/ssh
#fi
#$lux/usr/bin/sshd
# SSHD end
#export LS_OPTIONS="-ApLFhHl --color=auto --group-directories-first"
export EDITOR="$lux/usr/bin/nano --syntax=sh " VISUAL="$EDITOR"
cd "$orig_dir"
alias nano='$EDITOR '

