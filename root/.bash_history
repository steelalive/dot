. /dot/bin/env.sh
path
ls /ext/opt/platform
ls /ext/opt/platform-tools/
exit
lsblk
nano /etc/fstab
nvim /etc/fstab
lsblk
blkid
nvim /etc/fstab
exit
mkdir -p /usr/local/bin
curl -L 'https://github.com/mvdan/sh/releases/download/v2.6.2/shfmt_v2.6.2_linux_amd64' --output  /usr/local/bin/shfmt
chmod a+x /usr/local/bin/shfmt
echo '**Enjoy shellscript!**'
echo 'fork or star  https://github.com/foxundermoon/vs-shell-format'
mkdir -p /usr/local/bin
curl -L 'https://github.com/mvdan/sh/releases/download/v2.6.4/shfmt_v2.6.4_linux_amd64' --output  /usr/local/bin/shfmt
chmod a+x /usr/local/bin/shfmt
echo '**Enjoy shellscript!**'
echo 'fork or star  https://github.com/foxundermoon/vs-shell-format'
ls
. env.sh
rm -rf /tmp/makepkg
ls
env
makepkgsu
ls
makepkgsu
cd /tmp/makepkg/qt4/src/
ls
cd qt-everywhere-opensource-src-4.8.7
ls
cd /ext/yay/qt4
gitreset
rm -rf /tmp/makepkg
ls
makepkgsu
ls
makepkgsu
cd /tmp/makepkg/qt4/src
ls
ca /ext/yay/qt4/PKGBUILD 
pkgname=qt4
pkgver=4.8.7
pkgrel=28
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework'
depends=('sqlite' 'ca-certificates' 'fontconfig' 'libgl' 'libxrandr' 'libxv' 'libxi' 'alsa-lib'         'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'libmng' 'dbus')
makedepends=('postgresql-libs' 'mariadb-libs' 'unixodbc' 'cups' 'gtk2' 'libfbclient'              'mesa')
optdepends=('postgresql-libs: PostgreSQL driver'             'mariadb-libs: MariaDB driver'             'unixodbc: ODBC driver'             'libfbclient: Firebird/iBase driver'             'libxinerama: Xinerama support'             'libxcursor: Xcursor support'             'libxfixes: Xfixes support'             'icu: Unicode support'             'sni-qt: StatusNotifierItem (AppIndicators) support')
replaces=('qt<=4.8.4')
conflicts=('qt')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("https://download.qt.io/archive/qt/4.8/${pkgver}/${_pkgfqn}.tar.gz"         'qtconfig-qt4.desktop' 'assistant-qt4.desktop' 'designer-qt4.desktop'         'linguist-qt4.desktop' 'qdbusviewer-qt4.desktop'         'improve-cups-support.patch'         'moc-boost-workaround.patch'         'kubuntu_14_systemtrayicon.diff'         'kde4-settings.patch'         'glib-honor-ExcludeSocketNotifiers-flag.diff'         'disable-sslv3.patch'         'l-qclipboard_fix_recursive.patch'         'l-qclipboard_delay.patch'         'qt4-gcc6.patch' 'qt4-glibc-2.25.patch' 'qt4-icu59.patch' 'qt4-openssl-1.1.patch')
sha256sums=('e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0'             '157eb47865f0b43e4717819783823c569127a2e9fc48309982ca0f2b753517a1'             'd63f22858174489068c30a12b9115d1b4e23ade00c31c117513212e9a225c1ce'             'c154de65da1b81564fa68f29c773b5f1751e0ee821e858ee8f0684b8d027da58'             '22bd69ee3ba986448a63e41f529a7d28d0f2e6d83d6114e763eba761db302e01'             '915a1cb0f7328840cac742c03f5121dc6e19498952c082b46c0bf7263bf6676d'             '3ccfefb432015e4a4ea967b030c51b10dcdfb1f63445557908ddae5e75012d33'             '876c681ef8fbcc25f28cd4ad6c697abf8a4165d540bae37433bc40256dbf9d62'             '9fad22674c5eec835613a7f16c11b865aa793b448e90974c0f804105284a548b'             'ce97da195445f145d9f82df8f8e5d8716128e869ec6632db66c7125be663d813'             'e7f8d1c906640b836454e8202a48602352609d8e44a33a3de05dc1d20f5b1a8a'             '829b02ba10f208c2beba8e8a0110b6d10c63932612dabc08d536f099b9f66101'             '5db36cbb0686b8a503941779c821febc4a0330dc260e51d603f7aa1e4d8860ad'             'af3648ddb2372333b0e428788fd2ffbcfe571653fb46f898a55ae5a202f7e242'             '51da49e41edac66559d3ec8dd0a152995a51a53e5d1f63f09fa089a8af7e3112'             'e6555f4a681227447e94e9f14e11626d50b7e5108aad06088311e87063bc0347'             '61d6bf45649c728dec5f8d22be5b496ed9d40f52c2c70102696d07133cd1750d'             'ff3ddb5428cd2ff243558dc0c75b35f470077e9204bbc989ddcba04c866c1b68')
export pkgdir=/ext/yay/qt4
export pkgsrc=/tmp/makepkg/qt4/src
ls
ca /ext/yay/qt4/PKGBUILD 
  export QT4DIR="${srcdir}"/${_pkgfqn}
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  cd ${_pkgfqn}
  ./configure -confirm-license -opensource     -prefix /usr     -bindir /usr/lib/qt4/bin     -headerdir /usr/include/qt4     -docdir /usr/share/doc/qt4     -plugindir /usr/lib/qt4/plugins     -importdir /usr/lib/qt4/imports     -datadir /usr/share/qt4     -translationdir /usr/share/qt4/translations     -sysconfdir /etc/xdg     -examplesdir /usr/share/doc/qt4/examples     -demosdir /usr/share/doc/qt4/demos     -plugin-sql-{psql,mysql,sqlite,odbc,ibase}     -system-sqlite     -no-phonon     -no-phonon-backend     -no-webkit     -graphicssystem raster     -openssl-linked     -nomake demos     -nomake examples     -nomake docs     -silent     -no-rpath     -optimized-qmake     -no-reduce-relocations     -dbus-linked     -no-openvg
make
env
ls
export QT4DIR=/tmp/makepkg/qt4/src/qt-everywhere-opensource-src-4.8.7
export LD_LIBRARY_PATH=/tmp/makepkg/qt4/src/qt-everywhere-opensource-src-4.8.7/lib
  ./configure -confirm-license -opensource     -prefix /usr     -bindir /usr/lib/qt4/bin     -headerdir /usr/include/qt4     -docdir /usr/share/doc/qt4     -plugindir /usr/lib/qt4/plugins     -importdir /usr/lib/qt4/imports     -datadir /usr/share/qt4     -translationdir /usr/share/qt4/translations     -sysconfdir /etc/xdg     -examplesdir /usr/share/doc/qt4/examples     -demosdir /usr/share/doc/qt4/demos     -plugin-sql-{psql,mysql,sqlite,odbc,ibase}     -system-sqlite     -no-phonon     -no-phonon-backend     -no-webkit     -graphicssystem raster     -openssl-linked     -nomake demos     -nomake examples     -nomake docs     -silent     -no-rpath     -optimized-qmake     -no-reduce-relocations     -dbus-linked     -no-openvg
make
  ./configure -confirm-license -opensource     -prefix /usr     -bindir /usr/lib/qt4/bin     -headerdir /usr/include/qt4     -docdir /usr/share/doc/qt4     -plugindir /usr/lib/qt4/plugins     -importdir /usr/lib/qt4/imports     -datadir /usr/share/qt4     -translationdir /usr/share/qt4/translations     -sysconfdir /etc/xdg     -examplesdir /usr/share/doc/qt4/examples     -demosdir /usr/share/doc/qt4/demos     -plugin-sql-{psql,mysql,sqlite,odbc,ibase}     -system-sqlite     -no-phonon     -no-phonon-backend     -no-webkit     -graphicssystem raster     -openssl-linked     -nomake demos     -nomake examples     -nomake docs     -silent     -no-rpath     -optimized-qmake     -no-reduce-relocations     -dbus-linked     -no-openvg
make
make confclean
  ./configure -confirm-license -opensource     -prefix /usr     -bindir /usr/lib/qt4/bin     -headerdir /usr/include/qt4     -docdir /usr/share/doc/qt4     -plugindir /usr/lib/qt4/plugins     -importdir /usr/lib/qt4/imports     -datadir /usr/share/qt4     -translationdir /usr/share/qt4/translations     -sysconfdir /etc/xdg     -examplesdir /usr/share/doc/qt4/examples     -demosdir /usr/share/doc/qt4/demos     -plugin-sql-{psql,mysql,sqlite,odbc,ibase}     -system-sqlite     -no-phonon     -no-phonon-backend     -no-webkit     -graphicssystem raster     -openssl-linked     -nomake demos     -nomake examples     -nomake docs     -silent     -no-rpath     -optimized-qmake     -no-reduce-relocations     -dbus-linked     -no-openvg
make
exit
. env.sh
. build/envsetup.sh 
srcenv
. build/envsetup.sh 
lunch
brunch
breakfast
mka otapackage
exit
exit
su
exit
makekernel
export src=/src
makekernel
. /dot/setpath.sh aosp
makekernel
gitreset
. env.sh
make C=2 V=1 W=2 ARCcH=arm64
make C=2 V=1 W=2 ARCcH=arm64 CROSS_COMPILE=aarch64-linux-android-
make C=2 V=1 W=2 ARCcH=arm64 CROSS_COMPILE=aarch64-linux-android- 
ls
exit
makekernel
export src=/src
makekernel
makekernel
mkdir -p /ext/out/target/product/zerofltecan/obj/KERNEL_OBJ
makekernel
ca env.sh
#CROSS_COMPILE='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-'; 
export CROSS_COMPILE='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-'
makekernel
export CC=aarch64-linux-gnu-gcc
makekernel
cd $kernel
ls
ls -a
ca env.shj
ca env.sh
export kernel="$src/kernel/samsung/exynos7420"
e bashnorc
e fn bashnorc
export kernel="$src/kernel/samsung/exynos7420" dot=/dot
env
e fn bashnorc
e fn bashnorc
ls
env
cd $kernel
ls
e Makefile 
makekernel
e Makefile 
makekernel
ls /src/prebuilts/linaro/linux-x86/aarch64/bin/aarch64-linux-gnu-gcc
e makekernel
makeconfig
makekernel
ls
ls arch/arm64/configs
make ARCH=arm64 lineageos_zerofltecan_defconfig
make
make mrproper
cd /src
m otapackage
. build/envsetup.sh 
lunch
brunch
m otapackage
ls
rm -rf *
resync
. build/envsetup.sh 
lunch
m otapackage
echo $O
echo $OUT_DIR/
e fn bashnorc
export O=/ext/out OUT_DIR=/ext/out
m otapackage
e $kernel/Makefile 
e env.sh
ca env.sh
sed "s|CROSS_COMPILE  := .*|\$($CROSS_COMPILE)|" $kernel/Makefile
sed "s|CROSS_COMPILE.*|\$($CROSS_COMPILE)|" $kernel/Makefile
sed "s|CROSS_COMPILE   :=|\$($CROSS_COMPILE)|" $kernel/Makefile
ca $kernel/Makefile
sed -e "s|CROSS_COMPILE   ?=.*| \$($CROSS_COMPILE)|" -e "s|CROSS_COMPILE	:=| \$($CROSS_COMPILE)" $kernel/Makefile
sed -e "s|CROSS_COMPILE   ?=.*| \$($CROSS_COMPILE)|" -e "s|CROSS_COMPILE	:=| \$($CROSS_COMPILE)|" $kernel/Makefile
sed -e "s|CROSS_COMPILE   ?=.*|CROSS_COMPILE   ?= $CROSS_COMPILE|" -e "s|CROSS_COMPILE	:=|CROSS_COMPILE      := $CROSS_COMPILE|" $kernel/Makefile
sed -e "s|CROSS_COMPILE   ?=.*|CROSS_COMPILE   ?= $CROSS_COMPILE|" -e "s|CROSS_COMPILE	:=.*|CROSS_COMPILE      := $CROSS_COMPILE|" -i $kernel/Makefile
e env.sh
e env.sh
sed -e "s|CROSS_COMPILE   ?=.*|CROSS_COMPILE   ?= $CROSS_COMPILE|" -e "s|CROSS_COMPILE	:=.*|CROSS_COMPILE      := $CROSS_COMPILE|" -i $kernel/Makefile
m otapackage
ca env.sh
cp -av /last/misc-android/Pixel2MOD-Dark.zip $O/target/product/*/obj/BOOTANIMATION/bootanimation.zip
cp -av /last/misc-android/Pixel2MOD-Dark.zip $O/target/product/zerofltecan/obj/BOOTANIMATION/bootanimation.zip
e env.sh
m otapackage
e device/samsung/zero-common/shims/libbauthtzcommon/libbauthtzcommon.c
e device/samsung/zero-common/shims/libbauthtzcommon/libbauthtzcommon.c
ca device/samsung/zero-common
ls
ls -a
ca device/samsung/zero-common
cd device/samsung/zero-common
ls
gitreset
cd /src
m otapackage
. build/envsetup.sh 
lunch
env
m otapackage
ca env.sh
cd /ext/out/target/product/zerofltecan/
ls
ls
. env.sh
killjobs
ls
path
env
e setpath
e setpath
resync
. env.sh
resync
. env.sh
cd /tmp
ls
rm -rf *
ls
. env.sh
ls
makeconfig
e makeconfig
e makeconfig
makeconfig
echo $kernel
cd $kernel
makeconfig
ca makekernel
ca makeconfig
make ARCH=arm64 lineageos_zerofltecan_defconfig
make xconfig
echo $CROSS_COMPILE
. env.sh
rm /dot/info/.config
resync
ls
. env.sh
. env.sh
cp -av  /ext/out/target/product/zerofltecan/lineage_zerofltecan-ota-eng.root.zip /last/s6/
m clobber
ls
m help
reporeset
resync
ls
. env.sh
ls
su
. env.sh
 ls
srcenv
adb push /ext/out/target/product/zerofltecan/lineage_zerofltecan-ota-eng.root.zip /sdcard/Download/
resync
ls
rm -rf *
repo sync
ls
. env.sh
 mm SystemUI
m
. env.sh
m
mm android_system_stubs_current
ls
ls
. env.sh
ls
ls
 updateall
resync
. env.sh
e env.sh
e env.sh
e env.sh
. env.sh
. env.sh
cd Ã/ext/last/
ls
cd /ext
ls
cd last/
ls
rm -rf BACKUP BACKUP.zip DCIM PortableApps winbackup pacman Winpse
df
df -h
df -h --color
df -h --help
cd /src
srcenv
. env.sh
m clobber
. env.sh
resync
. env.sh
rm -rf /tmp/*
ls /tmp
srcenv
. env.sh
mm core-libart
srcenv
mm Backgrounds 
srcenv
env
srcenv
mm Email
m
m clobber
srcenv
ls
. env.sh
mm Backgrounds
srcenv
mm Bluetooth
export LLVM_ENABLE_THREADS=1
srcenv
mm CaptivePortalLogin
m
mm DeskClock
m
mm Email
m
m clobber
reporeset
resync
. env.sh
. env.sh
resync
su
netreset
systemctl stop connman.service connman-vpn.service 
systemctl disable  connman.service connman-vpn.service 
e netreset
systemctl enable NetworkManager
systemctl start NetworkManager
src
sudo su
lsls
. /etc/profile
. /etc/profile
exit
su
sudo su
ls
su
sudo su
ls
su
ls
e /dot/root/folders/.config/terminator/config
nvim /dot/root/folders/.config/terminator/config
sudo nvim /dot/root/folders/.config/terminator/config
rm /dot/root/folders/.config/terminator/config 
cd /last/
ls
cd BACKUP/
ls
..
cd ..
unzip dot.zip -d /tmp/
ls /tmp/dot/root/folders/.config/terminator/ /dot/root/folders/.config/terminator/c
cd /last
l
sls
ls
cd BACKUP/
ls
lk
unzip dot.zip -d /tmp/
ls /tmp/dot/root/folders/.config/terminator/ /dot/root/folders/.config/terminator/c
cp /tmp/dot/root/folders/.config/terminator/config /dot/root/folders/.config/terminator/
sudo nvim /tmp/dot/root/folders/.config/terminator/config 
lnr /dot/root/folders/.config/terminator/config /root/.config/terminator/config 
ls /dot/root/folders/.config/terminator/config 
cp /tmp/dot/root/folders/.config/terminator/config /dot/root/folders/.config/terminator/
lnr  /root/.config/terminator/config /dot/root/folders/.config/terminator/config
ls /dot/root/folders/.config/terminator/config 
rm /dot/root/folders/.config/terminator/config 
rm /dot/root/folders/.config/terminator/config
rm /root/.config/terminator/config
rm /shell/.config/terminator/config
ls
sudo su
src
nvim /dot/init.sh 
ls
env
clear && clear && ./superr
export TERM=xterm-256color
clear && clear && ./superr
clear && clear && ./superr
clear && clear && ./superr
systemctl
exit
lsblk
mount /last
pacman -Syu
reboot
ls
mount /last
nano /etc/fstab/
nano /etc/fstab
exit
journalctl
systemctl
ls
ls  /lib/modules
ls  /lib/modules/5.3.8-arch1-1/
modprobe
modinfo
modutil
ls
exit
lsblk
mount /
mount /bppy
mount /boot
ls /boot
ls -l /boot
ls
nano /etc/fstab
exit
nano /dot/ps1bg.sh 
ls
lk
iwconfig
lsblk
reboot
ls
nvim /dot/ps1bg.sh 
ls
nvim /dot/ps1bg.sh 
bash /dot/init.sh 
bash /dot/ps1bg.sh 
bash -xv /dot/ps1bg.sh 
bash -x /dot/ps1bg.sh 
. /dot/ps1bg.sh 
ca /dot/ps1bg.sh 
typea ps1_writer 
type -a ps1_writer 
load_cpu & sys_color ${sys_color_options} count
load_cpu & sys_color ${sys_color_options} count
load_cpu & sys_color ${sys_color_options} 
load_cpu & sys_color ${sys_color_options} 
load_cpu & sys_color ${sys_color_options} 
load_cpu & sys_color  count
load_cpu & sys_color  count
load_cpu & sys_color  count
echo ${sys_color_options} 
load_cpu & sys_color freq
load_cpu & sys_color freq
load_cpu & sys_color mem
load_cpu & sys_color mem
echo ${sys_color_options} 
load_cpu & sys_color load
load_cpu & sys_color load
load_cpu & sys_color temp
nvim /dot/ps1bg.sh 
. /dot/ps1bg.sh 
load_cpu & sys_color temp
load_cpu & sys_color temp
load_cpu & sys_color temp
load_cpu & sys_color temp
load_cpu & sys_color temp
load_cpu & sys_color temp
load_cpu & sys_color temp
src
sudo su
nvim /dot/shell/etc/mk
nvim /dot/slash/etc/mk
nvim /dot/slash/etc/mk
su
su 
chmod 755 /tmp
su
su
s
sudo su
pacman -S terminator
su
sudo su
ls
su 
su -
su -
src
su
su -
su
su -
su --
exec sudo bash -il
bash
bash
bash
ls
. /dot/init.sh
mount -o remount,rw /
nano /etc/fstab
mount /dev/sda6 -o remount,rw /
nano /etc/fstab
mount -av
reboot
