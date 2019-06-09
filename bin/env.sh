#
# /etc/makepkg.conf
#vi:set noro
PS1='ANDROID\$ '
if [[ $1 == clear ]]; then
	#unalias -a

	for func in $(declare -f | grep ".* ()" | cut -d' ' -f1); do unset $func; done
	# get USER, HOME and DISPLAY and then completely clear environment
	U=$USER
	H=$HOME
	D=$DISPLAY

	for i in $(env | awk -F"=" '{print $1}'); do
		unset $i
	done

	# set USER, HOME and DISPLAY and set minimal path.
	export USER=$U
	export HOME=$H
	export DISPLAY=$D

	# initial path
	export PATH=/usr/androbin:/usr/bin:/usr/local/bin:/dot/bin:/dot/bin/final
	#. /usr/share/bash-completion/bash_completion
	unset O U H D
else
	shift
fi
set -a
src=/src
cd $src || return
if [[ $PWD == /src ]]; then
	src="$PWD"
	PS1='/src-ANDROID-\W-\$ '
elif [[ $PWD == /ext ]]; then
	src="$PWD"
	PS1='/ext-ANDROID\-W-\$ '
else
	return
fi
unset O OUT_DIR CXXFLAGS CFLAGS APP_CFLAGS LDFLAGS CC CXX CONFIG_CROSS_COMPILE CROSS_COMPILE TARGET_TOOLS_PREFIX ARCH SUBARCH CROSS_COMPILE ROM_LUNCH

O=/ext/out
OUT_DIR=$O
#abi=soft
#CFLAGS="-Wnoerror -march=armv7 -mandroid -marm -O3 -mtune=cortex-a9 -w32 -fPIC -O2 -pipe -fno-plt"
#	LDFLAGS="-march=armv7"
#APP_CFLAGS='-O3 -mcpu=cortex-a9'
#CFLAGS='=Wnoerror'
#CXXFLAGS='-Wnoerror'
#LDFLAGS='-Wnoerror'
#rom=zerojflt
#CFLAGS='-march=armv7-a+neon-vfpv4 -mandroid -marm -O3 -w32 -fPIE -fPIC -mfpu=neon-vfpv4 -pipe -fno-plt'
#CFLAGS='-march=armv7-a -mtune=cortex-a53 -O3 -w32 -fPIE -fPIC -mfloat-abi=hard -mfpu=neon -pipe -fno-plt'
#LDFLAGS='-march=armv7-a -mfpu=neon-vfpv4 -pie'
#LDFLAGS='-march=armv7 -mfpu=netdev_max_backlogn -mfloat-abi=hard -pie -Wl,--fix-cortex-a7'
rom='zerofltecan'
DEVICE_COMMON='zero-common'
VENDOR=samsung
DEVICE=zerofltecan
#ARCH='arm'
#CARCH='armv7'
CC='zapcc'
CCACHE_DIR='/var/.ccache'
CCACHE_TEMPDIR='/tmp/.ccache'
#CROSS_COMPILE='/ext/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-'
#CROSS_COMPILE='/opt/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabi/bin/arm-linux-gnueabi-'
#CROSS_COMPILE='/ext/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-'
#CROSS_COMPILE='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-'
#CROSS_COMPILE='/ext/opt/gcc-from_source_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-'
#CROSS_COMPILE='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-'
#CROSS_COMPILE="aarch64-linux-android-"
#CROSS_COMPILE='/ext/opt/gcc-linaro-7.4.1-2019.02-x86_64_armv8l-linux-gnueabihf/bin/armv8l-linux-gnueabihf-'
ARCH="arm64"
#CROSS_COMPILE='/src/prebuilts/gcc/linux-x86/arm/arm-eabi-7.3/bin/arm-eabi-'
#CROSS_COMPILE='/usr/bin/arm-none-eabi-'
#CROSS_COMPILE='/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-'
#CONFIG_CROSS_COMPILE="/opt/aarch64-linux-android-gcc/bin/aarch64-linux-android-"
#CONFIG_CROSS_COMPILE="$CROSS_COMPILE"
#TARGET_TOOLS_PREFIX="$CROSS_COMPILE"
CM_ROOT=$O
NDK_DEBUG=0
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01;33:quote=01;34'
CXX='zapcc++'
CXXFLAGS="$CFLAGS"
#TARGET_USE_SDCLANG='true'
#SDCLANG_PATH='prebuilts/clang/linux-x86/host/sdclang-3.8/bin'
#SDCLANG_LTO_DEFS='device/qcom/common/sdllvm-lto-defs.mk'
dot='/dot'
kernel=$src/kernel/samsung/exynos7420
LANG='C'
LC_ALL='C'
LC_COLLATE='C'
LC_TIME=C
MAKEFLAGS='-j4'
NDK='/ext/opt/ndk-bundle'
OUT_DIR=$O
#OUT_DIR_COMMON_BASE=$O
#SHELL="${SHELL:-"$(command -v bash 2>/dev/null || command -v sh 2>/dev/null)"}"
#JAVA_HOME='/usr/lib/jvm/default'
#SUBARCH='arm'
#TARGET_BUILD_TYPE='debug'
#TARGET_BUILD_VARIANT='eng'
TOP="$src"
TOPDIR="$TOP/"
#MANIFESTURL='https://raw.githubusercontent.com/FacuM/los_harpia/master/harpia.xml'
USER='root'
OVERRIDE_RUNTIMES=runtime_libart_default
USE_CCACHE=1
#USE_NINJA='true'
WITH_SU='true'
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Xmx5g'
ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx5G"
JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"
#ROM_LUNCH='lineage'
#BREAKFAST_DEVICE="$rom"
REPO_INIT_OPTS='--depth=1 --no-clone-bundle'
REPO_SYNC_OPTS='--force-sync --force-broken --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune'
REPO_SYNC_THREADS="$(nproc --all)"
KCONFIG_NOTIMESTAMP=true
BUILD_WITH_COLORS=1
#TARGET_PREBUILT_KERNEL="$O/kernel.prebuilt"
ccache -M 50G
cd "$src" || return
[[ $1 == here ]] && src="$PWD"
[[ "$PS1" ]] || PS1="$(tput setaf 1)#\\u$(tput setaf 2)@$(tput setaf 3)\h:$(tput setaf 2)\w$(tput setaf 6)#$(tput setaf 5)~~$(tput setaf 6)\d$(tput setaf 5)~~$(tput setaf 6)\@$(tput setaf 5)~$(tput setaf 2)\t$(tput setaf 5)~HIST:\!~CMD:$(tput sgr0)\n\#\$ "
sysctl -w net.ipv4.tcp_window_scaling=0
alias jacksetup='killall java;cd $src; rm -rf /root/.jack-se*;  $src/prebuilts/sdk/tools/jack-admin install-server $src/prebuilts/sdk/tools/jack-launcher.jar $src/prebuilts/sdk/tools/jack-server-*.ALPHA.jar; jackstart'
alias jackstart='$src/prebuilts/sdk/tools/jack-admin start-server '
alias makeclean='cd $src; m clobber; choosecombo 2 lineage_$DEVICE eng'
alias lsconfig='ls $kernel/arch/arm64/configs'
set +a
combo() { choosecombo 2 lineage_$VENDOR eng; }
srcenv() {
	killall java zapccs
	rmrf "/tmp/jack-" /tmp/*.log
	. /dot/setpath.sh aosp
	mka otapackage -j$(nproc --all)
	#mka updatepackage -j$(nproc --all)
	beep.sh
}

cd "$src" || return
. /dot/setpath.sh aosp
if sed -r "s|:+|:|g" <<<$PATH &>/dev/null; then
	PATH="$(sed -r "s|:+|:|g" <<<$PATH)"
	export PATH
fi

[[ $1 == quit ]] && return
#[[ -e $O/target/product/harpia/obj/BOOTANIMATION/bootanimation.zip ]] || {
#	cp /last/misc-android/BOOTANIMS/Pixel_2_Dark_No_Text/bootanimation.zip $O/target/product/harpia/obj/BOOTANIMATION/bootanimation.zip 2 &>/dev/null
#}
[[ -e kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltecan_defconfig ]] || cp kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltexx_defconfig kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltecan_defconfig
. build/envsetup.sh
export -f add_lunch_combo
unset reposync
lunch lineage_zerofltecan-userdebug
#lunch rr_zerofltecan-userdebug
croot
#combo
#ln -s /usr/bin/python2.7 $O/host/linux-x86/bin/python 2>/dev/null

#cp -av /dot/info/.config /src/kernel/samsung/exynos7420/arch/arm64/configs/lineageos_zerofltecan_defconfig
ln -sf /usr/bin/python2.7 /usr/androbin/python 2>/dev/null
#[[ -e /dot/info/harpia_defconfig ]] && cp -av /dot/info/harpia_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/harpia_defconfig
#cp -av /dot/info/msm8916_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/
#for_sed 'CONFIG_CROSS_COMPILE=.*' 'CONFIG_CROSS_COMPILE='"\"$CROSS_COMPILE\"" $(echo $kernel/arch/arm/configs/*) $src/kernel/motorola/msm8916/arch/arm/configs/harpia_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/msm8916_defconfig /dot/info/msm8916_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_kitkat_defconfig
#for_sed 'CROSS_COMPILE=.*' 'CROSS_COMPILE='"\"$CROSS_COMPILE\""  $(echo $kernel/arch/arm/configs/*) src/kernel/motorola/msm8916/arch/arm/configs/harpia_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/msm8916_defconfig /dot/info/msm8916_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_kitkat_defconfig
#for_sed 'TARGET_TOOLS_PREFIX.*' 'TARGET_TOOLS_PREFIX:='"$CROSS_COMPILE" $src/buildspec.mk
#for_sed 'CONFIG_DEFAULT_HOSTNAME="(none)"' 'CONFIG_DEFAULT_HOSTNAME='"\"s4\"" $(echo $kernel/arch/arm/configs/*) $src/kernel/motorola/msm8916/arch/arm/configs/_defconfig $src/kernel/motorola/msm8916/arch/arm/configs/msm8916_defconfig /dot/info/msm8916_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_defconfig $src/kernel/ti/omap4/arch/arm/configs/espresso_kitkat_defconfig

echo "hmm?"
. /dot/setpath.sh aosp
#/dot/bin/yorn && {
	#ln -s "$(command -v adb)" /usr/androbin 2>/dev/null
	srcenv
