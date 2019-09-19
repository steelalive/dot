#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Thu May  3 08:49:25 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.1.0.0 - #_# #@#030518#@# #2#
#3#::..#####################_/dot/bin/setup_arch.sh_#######################..::#3#
TZ=${TZ:-EST5EDT}
dot_dir="${dot_dir:-/dot}"
dot=/dot
[[ $1 == gcc ]] && echo 'pacman -S --needed --ignore=gcc-libs --ignore=gcc base base-devel' && exit
[[ $HOME ]] || HOME=/root
#ln -srvf "${dot}"/bin "$HOME"
#for i in $(find ${dot}/root -maxdepth 1 -type f -printf "%f\n");do rm -v /root/"$i"; ln -srfv "${dot}/root/$i" $HOME/;chown master:wheel $HOME/$(basename $i); done
#for i in $(find ${dot}/root -mindepth 1 -maxdepth 1 -type d -printf "%f\n");do ln -srfv "${dot}/root/$i" $HOME/; chown master:wheel $HOME/$(basename $i) ; done
#for i in $(find ${dot}/etc -maxdepth 1 -type f -printf "%f\n");do rm /etc/$i; ln -srfv "${dot}/etc/$i" /etc/; chown master:wheel "/etc/$(basename $i)"; done
#for i in $(find ${dot}/root/.config -maxdepth 1 -type f );do rm -v "$HOME/.config/$(basename $i)";ln -srfv "$i" "$HOME/.config/"; chown master:wheel "$HOME/.config/$(basename $i)"; done
#for i in $(find ${dot}/root/.config -mindepth 1 -maxdepth 1 -type d );do ln -srfv "$i" "$HOME/.config/"; chown master:wheel "$HOME/.config/$(basename $i)" ;done
#ln -srfv /dot/etc/default/grub /etc/default/;ln -srfv /dot/etc/cron.daily/daily.sh /etc/cron.daily/;ln -srfv /dot/etc/ssh/sshd_config /etc/ssh/;  chown master:wheel /etc/ssh/sshd* /etc/cron.daily/daily.sh /etc/default/grub
dot_root() {
	find "${dot}"/$1 -type d | mkdir -p $(sed "s|${dot}||")
	for a in $(for line in $(find "${dot}"/$1 -type f -print); do
		echo "$line"
	done); do
		echo lnr $a $(echo $a | sed "s|"${dot}"||")
	done
}
#for a in $(for line in $(find "${dot}"/etc -type f -print); do echo "$line"; done); do lnr $a $(echo $a | sed "s|"${dot}"||"); done
#rm -v "$HOME/.local/share"
#ln -srvf "${dot}/root/.local/share" "$HOME/.local/"
#chown master:user "$HOME/.local/share"
#rm -rf "$HOME/.kde4"
#ln -srvf "${dot}/root/.kde4" "$HOME/"
#chown master:user "$HOME/.kde4"
#rm -rf /root/.kde4/share
#mkdir -p /root/.kde4/share
#lnr /dot/root/.kde4/share /root/.kde4/
if grep 'ExecStart=-/sbin/agetty --noclear %I $TERM' /usr/lib/systemd/system/getty@.service &>/dev/null; then
	sed -i "s/agetty --noclear/agetty --noclear -a master/" /usr/lib/systemd/system/getty@.service
fi

if [[ $1 != all ]]; then
	exit
fi
groupadd -r -g 2000 shell
useradd -m -d /shell -g root -G wheel,video,users,shell shell
mkdir -p /shell
chown -cR shell:root /root /tmp $dot /shell
usermod -a -G video sddm
################_Link dot_############################
(
	cd $dot/root || exit 1
	for files in .??*; do
		lnr "$files" /root/"$files"
		lnr "$files" /shell/"$files"
	done
)
(
	cd $dot/root/folders || exit 1
	lnr .android .dotfiles2 .nano .SpaceVim .SpaceVim.d .ssh /shell/
)
(
	cd $dot/root/folders || exit 1
	lnr .android .dotfiles2 .nano .SpaceVim .SpaceVim.d .ssh /root/
)
(
	cd $dot/root/folders/.config || exit 1
	mkdir -p /root/.config
	lnr * /root/.config/
)
(
	cd $dot/root/folders/.config || exit 1
	mkdir -p /shell/.config
	lnr * /shell/.config/
)
(
	cd $dot/etc/folders || exit 1
	for folders in *; do lnr $folders/* /etc/$folders/; done
)
#Nvim setup
lnr $dot/root/.??* /shell/
lnr $dot/root/.??* /root/
lnr $dot/root/folders/.SpaceVim /shell/.config/nvim
lnr $dot/root/folders/.SpaceVim /root/.config/nvim
rm -v /root/.config/nvim /shell/.config/nvim
lnr .SpaceVim /root/.config/nvim
lnr .SpaceVim /shell/.config/nvim
###############_link_dot_############################

#ln -s /dot/root/.??* /home/
#ln -s /dot/root/.??* /root/
#mkdir /root/.config;ln -sf /dot/root/.config/* /root/.config/;
#ln -sf /dot/etc/gemrc /dot/etc/hosts* /dot/etc/ntp.conf /dot/etc/profile /dot/etc/sudoers /dot/etc/updatedb.conf /etc/;
#[[ -e /var/swap ]] || fallocate -l 8000M /var/swap
#chmod 600 /var/swap
#mkswap /var/swap
#swapon /var/swap
rm -v /etc/localtime
ln -srfv /usr/share/zoneinfo/EST5EDT /etc/localtime
rm /etc/timezone
echo "EST5EDT" >/etc/timezone
mkdir -p /root/.config /root/doc
cd $HOME
rmdir Pictures Documents Music Public Templates Videos
#echo 'LANGUAGE="en_US"
#LANG="en_US.UTF-8"
#LC_CTYPE="en_US.UTF-8"
#LC_NUMERIC="en_US.UTF-8"
#LC_TIME="en_US.UTF-8"
#LC_COLLATE="C"
#LC_MONETARY="en_US.UTF-8"
#LC_MESSAGES="en_US.UTF-8"
#LC_PAPER="en_US.UTF-8"
#LC_NAME="en_US.UTF-8"
#LC_ADDRESS="en_US.UTF-8"
#LC_TELEPHONE="en_US.UTF-8"
#LC_MEASUREMENT="en_US.UTF-8"
#LC_IDENTIFICATION="en_US.UTF-8"' >/etc/locale.conf
#cd /home/master && mkdir -p media Documents Desktop
export LC_ALL=en_US.UTF-8
cd /root && mkdir -p doc
cd $HOME && mkdir -p doc
SEARCH="#en_US.UTF-8 UTF-8"
REPLACE="en_US.UTF-8 UTF-8"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/locale.gen
SEARCH="#en_CA.UTF-8 UTF-8"
REPLACE="en_CA.UTF-8 UTF-8"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/locale.gen
SEARCH="#[multilib]
#Include = /etc/pacman.d/mirrorlist"
REPLACE="[multilib]
Include = /etc/pacman.d/mirrorlist"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/pacman.conf
localectl set-locale LANG=en_US.UTF-8
locale-gen
export LANG=en_US
export LC_ALL=en_US.UTF-8
sed -i 's/#Color/Color/' /etc/pacman.conf
nano /etc/pacman.conf
pacman -S --needed pacman
pacman -S --needed --noconfirm archlinux-keyring
pacman-key --init
if grep "x86_64" /etc/makepkg.conf; then
	pacman-key --populate archlinux
	echo PC >/etc/hostname
	hostnamectl set-hostname PC
	hostname PC
else
	echo "is it arm?"
	yorn && {
		pacman-key --populate archlinuxarm
		groupadd -g 3001 aid_bt
		groupadd -g 3002 aid_bt_net
		groupadd -g 3003 aid_inet
		groupadd -g 3004 aid_net_raw
		groupadd -g 3005 aid_admin
		usermod -a -G aid_bt,aid_bt_net,aid_inet,aid_net_raw,aid_admin master
		usermod -a -G aid_bt,aid_bt_net,aid_inet,aid_net_raw,aid_admin root
	}
fi
pacman -Syu --needed --ignore=filesystem
pacman -S --needed --noconfirm filesystem --force
pacman -S --needed --ignore=gcc-libs --ignore=gcc base base-devel
pacman -S --needed --force --noconfirm bash-completion htop openssh git wget \
	diffutils libnewt dialog wpa_supplicant wireless_tools iw crda lshw highlight \
	source-highlight pygmentize ruby ruby-bundler \
	arp-scan ntp the_silver_searcher
#
pacman -S --needed --noconfirm lsof strace shellcheck rsync \
	python-pygit2 xsel expect irqbalance
pacman -S --needed --noconfirm net-tools ntfs-3g dialog mlocate optipng ccache
if grep "x86_64" /etc/makepkg.conf; then

	pacman -S --needed --noconfirm python-pip ruby gpm

	pacman -S --needed --noconfirm alsa-utils alsa-firmware alsa-lib alsa-plugins xorg-xset \
		xclip ack neovim alsa-plugins xorg-apps perl-extutils-installpaths \
		perl-extutils-depends perl-extutils-pkgconfig \
		perl-extutils-config perl-extutils-installpaths xdg-user-dirs perl-extutils-xsbuilder \
		perl-json perl-mime-base32
	systemctl enable gpm sshd.service sshd.socket irqbalance
	systemctl start gpm sshd.service sshd.socket irqbalance
	pip install --upgrade neovim
	gem install neovim
fi
is_in_path cpanm && {
	cpanm App::cpanoutdated
	cpan-outdated -p | cpanm
}
rm /etc/profile.d/gpm.sh
localectl set-x11-keymap pc105+inet
localectl set-keymap us

if [[ ! -d $HOME/.gnupg ]]; then
	mkdir $HOME/.gnupg
	echo 'keyserver-options auto-key-retrieve' >$HOME/.gnupg/gpg.conf
	echo 'keyserver hkp://pgp.mit.edu' >>$HOME/.gnupg/gpg.conf
	chmod -R go-rwx $HOME/.gnupg
	chmod 600 $HOME/.gnupg
fi
balooctl disable
timedatectl set-ntp true
hwclock --systohc
chmod 0644 /dot/etc/sudoers.d
# echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/bin/ethtool -s %k wol d"' >/etc/udev/rules.d/70-disable_wol.rules
#if grep 'ExecStart=-/sbin/agetty --noclear %I $TERM' /usr/lib/systemd/system/getty@.service; then
#	sed -i "s/agetty --noclear/agetty --noclear -a master/" /usr/lib/systemd/system/getty@.service
#fi
#mkdir -p '/etc/systemd/system/getty@.service.d'
#echo -e '[Service]\nTTYVTDisallocate=no' >'/etc/systemd/system/getty@.service.d/no-disallocate.conf'
sed -i 's/#LogLevel=info/LogLevel=warning/' /etc/systemd/system.conf
sed -i 's/#DumpCore=yes/DumpCore=no/' /etc/systemd/system.conf
sed -i 's/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=20s/' /etc/systemd/system.conf
sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=20s/' /etc/systemd/system.conf
sed -i 's/#ShutdownWatchdogSec=10min/ShutdownWatchdogSec=60s/' /etc/systemd/system.conf
sed -i 's/#Storage=auto/Storage=volatile/' /etc/systemd/journald.conf
sed -i 's/#SplitMode=uid/SplitMode=none/' /etc/systemd/journald.conf
sed -i 's/#MaxLevelStore=debug/MaxLevelStore=warning/' /etc/systemd/journald.conf
sed -i 's/#KillExcludeUsers=root/KillExcludeUsers=/' /etc/systemd/logind.conf
sed -i 's/#Seal=yes/Seal=no/' /etc/systemd/journald.conf
sed -i "s/COMPRESSXZ=.*/COMPRESSXZ=(xz -c -z - --threads=$(nproc --all))/" /etc/makepkg.conf
sed -i 's/#DefaultTimeoutStartSec=90s/DefaultTimeoutStartSec=30s/' /etc/systemd/user.conf
sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=20s/' /etc/systemd/user.conf
exit

rm -f /arch2.sh
mkdir /etc/systemd/system/ntpdate.service.d
echo "[Service]
ExecStart=/usr/bin/hwclock -w" >/etc/systemd/system/ntpdate.service.d/hwclock.conf

# Configure the System {{{1

# Time Zone
hwclock --systohc

# Locale
#locale-gen
#echo LANG=en_US.UTF-8 > /etc/locale.conf
echo "hostname  is $HOSTNAME"
echo "Change it?"
yorn && read -p "???
" hostname
[[ $hostname ]] && HOSTNAME=$hostname
# Hostname
echo $HOSTNAME >/etc/hostname
hostname $HOSTNAME
hostnamectl set-hostname $HOSTNAME
echo $HOSTNAME >/etc/hostname

# Network configuration
# systemctl enable dhcpcd@wlp4s0.service
# systemctl enable dhcpcd.service

#read -p "Please give password: " password
#read -p "Please repeat password: " password2

#while [[ $password != $password2 ]] ; do
#    echo "Passwords do not match"
#    read -p "Please give password: " password
#    read -p "Please repeat password: " password2
#done

# Root password
#echo "root:$password" | chpasswd

# Boot loader
#pacman -S --noconfirm intel-ucode
#bootctl --path=/boot install

#echo "\
#default arch
#timeout 4
#editor  0" \
#> /boot/loader/loader.conf

#echo "\
#title       Arch Linux
#linux       /vmlinuz-linux
#initrd      /intel-ucode.img
#initrd      /initramfs-linux.img
#options     root=PARTLABEL=ARCH" \
#> /boot/EFI/loader/entries/arch.conf

# Post-installation {{{1

#mkdir /mnt/{usb,sshfs}

# Add users
sensors-detect
#useradd -m -G wheel -s $(which bash) master
#echo "master:$password" | chpasswd

# Enable members of 'wheel' group to use root
SEARCH="# %wheel ALL=\(ALL\) NOPASSWD: ALL"
REPLACE="%wheel ALL=\(ALL\) NOPASSWD: ALL"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/sudoers

# Edit pacman.conf
perl -i -pe "s/#Color/Color/g" /etc/pacman.conf
perl -i -pe "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf

! grep load-module module-switch-on-connect /etc/pulse/default.pa && echo '
# automatically switch to newly-connected devices
load-module module-switch-on-connect' | sudo tee -a /etc/pulse/default.pa

# sets brightness to 50%
#echo $(($(cat /sys/class/backlight/intel_backlight/max_brightness) / 2)) | sudo tee /sys/class/backlight/intel_backlight/brightness

# Compiling Optimization {{{1

# ccache
SEARCH=" !ccache "
REPLACE=" ccache "
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Uses more threads for compilation
SEARCH='#MAKEFLAGS="-j."'
REPLACE="MAKEFLAGS=\"-j$(nproc)\""
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Disables compression of packages
SEARCH='PKGEXT=".pkg.tar.xz"'
REPLACE='PKGEXT=".pkg.tar"'
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf

# Uses more threads for compression
SEARCH="COMPRESSXZ=\(xz -c -z -\)"
REPLACE="COMPRESSXZ=(xz -c -z --threads=$(nproc))"
perl -i -pe "s/$SEARCH/$REPLACE/g" /etc/makepkg.conf
