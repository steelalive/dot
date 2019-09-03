#
# /etc/makepkg.conf
#vi:set noro
TITLE="\e]2;-----------------ANDROID-----------------\$\a"
PS1=$TITLE
PS1='ANDROID\$ '
#unalias -a

for func in $(declare -f | grep ".* ()" | cut -d' ' -f1); do unset $func; done
# get USER, HOME and DISPLAY and then completely clear environment
U=$USER
H=$HOME
D=$DISPLAY

for i in $(env | awk -F"=" '{print $1}'); do
	unset "$i" 2 &>/dev/null
done

# set USER, HOME and DISPLAY and set minimal path.
export USER=$U
export HOME=$H
export DISPLAY=$D

# initial path
export PATH=/usr/androbin:/usr/bin:/usr/local/bin:/dot/bin:/dot/bin/final
#. /usr/share/bash-completion/bash_completion
unset O U H D
export src=/ext/src
export dot=/dot
cd $src || return
PS1="ANDROID-\W-\$ "
# . /dot/anset.sh
#        . /usr/share/bash-completion/bash_completion
#. /dot/ex.sh
unset JAVA_HOME ANDROID_JAVA_HOME ANDROID_TOOLCHAIN ANDROID_JAVA_TOOLCHAIN O OUT_DIR CXXFLAGS CFLAGS APP_CFLAGS LDFLAGS CC CXX CONFIG_CROSS_COMPILE CROSS_COMPILE TARGET_TOOLS_PREFIX ARCH SUBARCH CROSS_COMPILE ROM_LUNCH PROMPT_COMMAND LD_LIBRARY_PATH FC_FLAGS FFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS CGO_LDFLAGS CGO_FFLAGS CGO_CXXFLAGS CGO_CFLAGS
set -a
ANDROID_API="android-28"
ANDROID_ARCH="arch-arm64"
ANDROID_NDK_ROOT='/ext/opt/ndk-bundle'
ANDROID_DEV="$ANDROID_NDK_ROOT/platforms/$ANDROID_API/$ANDROID_ARCH/usr"
ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3G"
ANDROID_MAJOR_VERSION=28
ANDROID_SYSROOT="$ANDROID_NDK_ROOT/platforms/$ANDROID_API/$ANDROID_ARCH"
ANDROID_TOOLCHAIN="$CROSS_COMPILE"
ARCH="arm64"
BUILD_WITH_COLORS=1
CC='/usr/bin/zapcc'
CCACHE_DIR='/var/.ccache'
CCACHE_TEMPDIR='/tmp/.ccache'
CFLAGS='-pipe -Ofast -mandroid -marm64 -w64 -fPIE -fPIC -fno-plt'
CM_ROOT=$O
CROSS_COMPILE='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-'
CROSS_COMPILE_ARM32='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_armv8l-linux-gnueabihf/bin/armv8l-linux-gnueabihf-'
CXX='/usr/bin/zapcc++'
CXXFLAGS="$CFLAGS"
DEVICE='zerofltecan'
DEVICE_COMMON='zero-common'
HOSTCC="$CC"
JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3096m"
KCONFIG_NOTIMESTAMP=true
LANG='C'
LC_ADDRESS='C'
LC_ALL='C'
LC_COLLATE='C'
LC_CTYPE='C'
LC_IDENTIFICATION='C'
LC_MONETARY='C'
LC_NAME='C'
LC_NUMERIC='C'
LC_PAPER='C'
LC_TELEPHONE='C'
LC_TIME='C'
LDFLAGS='-Ofast'
LLVM_ENABLE_THREADS=1
MAKEFLAGS='-j4'
NDK='/ext/opt/ndk-bundle'
NDK_DEBUG=0
O='/ext/out'
OUT_DIR="$O"
OVERRIDE_RUNTIMES=runtime_libart_default
REPO_INIT_OPTS='--depth=1 --no-clone-bundle'
REPO_SYNC_OPTS='--force-sync --force-broken --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune'
REPO_SYNC_THREADS="$(nproc --all)"
SUBARCH='arm64'
TOP="$src"
TOPDIR="$TOP/"
USER='root'
USE_CCACHE=1
USE_NINJA='true'
VENDOR='samsung'
WITH_SU='true'
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Xmx4g'
kernel="$src/kernel/samsung/exynos7420"
result="$(printf "%s" $O/target/product/*)"
rom='zerofltecan'
unset LC_ADDRESS LC_CTYPE LC_MEASUREMENT LC_NAME LC_PAPER LC_TIME LCLIMPORTDIR
unset LC_IDENTIFICATION LC_MONETARY LC_TELEPHONE LC_ALL LC_COLLATE
unset LC_COLLATE LC_NUMERIC
#JAVA_HOME='/usr/lib/jvm/default'
#TARGET_BUILD_VARIANT='eng'
#TARGET_BUILD_TYPE='debug'
#MANIFESTURL='https://raw.githubusercontent.com/FacuM/los_harpia/master/harpia.xml'
#BREAKFAST_DEVICE="$rom"
#TARGET_PREBUILT_KERNEL="$O/kernel.prebuilt"
ccache -M 50G
cd "$src" || return
[[ $1 == here ]] && src="$PWD"
[[ "$PS1" ]] || PS1="$(tput setaf 1)#\\u$(tput setaf 2)@$(tput setaf 3)\h:$(tput setaf 2)\w$(tput setaf 6)#$(tput setaf 5)~~$(tput setaf 6)\d$(tput setaf 5)~~$(tput setaf 6)\@$(tput setaf 5)~$(tput setaf 2)\t$(tput setaf 5)~HIST:\!~CMD:$(tput sgr0)\n\#\$ "
sysctl -w net.ipv4.tcp_window_scaling=0
set +a
alias jackstart='$src/prebuilts/sdk/tools/jack-admin start-server '
jacksetup() {
	killall java
	cd $src || return
	rm -rf /root/.jack-se*
	$src/prebuilts/sdk/tools/jack-admin install-server $src/prebuilts/sdk/tools/jack-launcher.jar $src/prebuilts/sdk/tools/jack-server-*.ALPHA.jar
	jackstart
}
makeclean() {
	cd $src || return
	[[ -d $O ]] || return
	mkdir empty && rsync -r --delete empty/ $O && rmdir empty
}
alias lsconfig='ls $kernel/arch/arm64/configs'
cdresult() {
	result="$(printf "%s" $O/target/product/*)"
	cd $result
}
combo() { choosecombo 2 lineage_$VENDOR eng; }
srcenv() {
	result="$(printf "%s" $O/target/product/*)"
	killall java zapccs
	rm -rfv /tmp/jack-* /tmp/*.log /tmp/makepkg /tmp/npm-* /tmp/*.zip /tmp/*.gz
	croot
	m -j4 otapackage || beep.sh
	result="$(printf "%s" $O/target/product/*)"
	#mka updatepackage -j$(nproc --all)
}
removeproject() {
	for i in $(grep "$@" $src/.repo/manifest.xml | grep -o 'name=".*"' | cut -d' ' -f1); do
		printf "<remove-project $i />\\n"
	done

}

cd "$src" || return
. /dot/setpath.sh aosp
if sed -r "s|:+|:|g" <<<$PATH &>/dev/null; then
	PATH="$(sed -r "s|:+|:|g" <<<$PATH)"
	export PATH
fi

[[ $1 == quit ]] && return
#[[ -e $O/target/product/harpia/obj/BOOTANIMATION/bootanimation.zip ]] || {
#	cp -av /last/misc-android/Pixel2MOD-Dark.zip $O/target/product/zerofltecan/obj/BOOTANIMATION/bootanimation.zip
#}
#[[ -e kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltecan_defconfig ]] || cp kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltexx_defconfig kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltecan_defconfig
. build/envsetup.sh
export -f add_lunch_combo
unset reposync
lunch lineage_zerofltecan-userdebug
#lunch rr_zerofltecan-userdebug
croot
#combo
#ln -s /usr/bin/python2.7 $O/host/linux-x86/bin/python 2>/dev/null
[[ -e $src/buildspec.mk ]] || cp -av $src/build/make/buildspec.mk.default $src/buildspec.mk
[[ -e $dot/info/.config ]] && cp -av $dot/info/.config $src/kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltecan_defconfig
ln -sf /usr/bin/python2.7 /usr/androbin/python 2>/dev/null
sed "s|/cm/|/lineage/|" -i $src/device/samsung/zero-common/*.sh $src/device/samsung/zerofltecan/*.sh
mkdir -p $O/kernel/samsung/exynos7420/../../../prebuilts/linaro/linux-x86/aarch64/
lnr /ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin $O/kernel/samsung/exynos7420/../../../prebuilts/linaro/linux-x86/aarch64/
#cd /ext/src/kernel/samsung/exynos7420/firmware/cypress && for i in *; do cp -av $i $(echo $i | cut -f1-2 -d.) 2>/dev/null;done

#[[ -e /dot/info/harpia_defconfig ]] && cp -av /dot/info/harpia_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/harpia_defconfig
#cp -av /dot/info/msm8916_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/
#for_sed 'CONFIG_CROSS_COMPILE=.*' 'CONFIG_CROSS_COMPILE='"\"$CROSS_COMPILE\"" $(echo $kernel/arch/arm/configs/*) $src/kernel/motorola/msm8916/arch/arm/configs/harpia_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/msm8916_defconfig /dot/info/msm8916_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_kitkat_defconfig
#for_sed 'CROSS_COMPILE=.*' 'CROSS_COMPILE='"\"$CROSS_COMPILE\""  $(echo $kernel/arch/arm/configs/*) src/kernel/motorola/msm8916/arch/arm/configs/harpia_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/msm8916_defconfig /dot/info/msm8916_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_kitkat_defconfig
#for_sed 'TARGET_TOOLS_PREFIX.*' 'TARGET_TOOLS_PREFIX:='"$CROSS_COMPILE" $src/buildspec.mk
#for_sed 'CONFIG_DEFAULT_HOSTNAME="(none)"' 'CONFIG_DEFAULT_HOSTNAME='"\"s4\"" $(echo $kernel/arch/arm/configs/*) $src/kernel/motorola/msm8916/arch/arm/configs/_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/msm8916_defconfig /dot/info/msm8916_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_kitkat_defconfig
#sed -e "s|CROSS_COMPILE   ?=.*|CROSS_COMPILE   ?= $CROSS_COMPILE|" -e "s|CROSS_COMPILE        :=.*|CROSS_COMPILE      := $CROSS_COMPILE|" -i $kernel/Makefile
cp -av /dot/info/Makefile $kernel/

echo "hmm?"
#/dot/bin/yorn && {
#ln -s "$(command -v adb)" /usr/androbin 2>/dev/null
yorn y && srcenv
