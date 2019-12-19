#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Thu May 31 03:10:37 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.0.2.6 - #_# #@#310518#@# #2#
#3#::..#####################_/dot/bin/setpath.sh_#######################..::#3#
dot=${dot:-/dot}
export PATH=$PATH:$dot/bin:$dot/bin/final:$dot
unset allpath
hash consolidate-path &>/dev/null || consolidate-path() {
	result=":"
	IFS=:
	for p in $1; do
		[[ $result == *:"$p":* ]] || result="${result}${p}:"
	done

	result="${result#:}"
	echo "${result%:}"
	unset IFS
}
hash consolidate-path &>/dev/null || export -f consolidate-path
unset IFS allpath
if [[ $1 == aosp ]]; then
	allpath="/usr/androbin
/usr/bin
/usr/sbin
/bin
/sbin
/usr/local/bin
/usr/local/sbin
/ext/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin
$src/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin
$src/prebuilts/gcc/linux-x86
$src/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
$O/host/linux-x86/bin
$src/development/scripts
$src/prebuilts/devtools/tools
$src/external/selinux/prebuilts/bin
$src/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
$src/prebuilts/android-emulator/linux-x86_64
$O/debug/host/linux-x86/bin
$O/host/linux-x86/bin
/ext/opt/prebuilt/linux-x86_64/bin"
fi
if [[ $1 = android ]]; then
	allpath+="/data/sbin
/sbin/supersu/xbin
/sbin/supersu/bin
/data/adb/su/xbin
/data/adb/su/bin
/su/xbin
/su/bin
/su/sbin
/supersu
/su
/sbin
/system/xbin
/system/bin
/vendor/xbin
/vendor/bin
/data/dot/slash/sbin
/system/sbin"
allpath+="/usr/bin
/usr/sbin
/bin
/sbin
/usr/local/bin
/usr/local/sbin
/usr/bin/lou_maketable.d
/usr/lib/jvm/default
/usr/lib/node_modules
/root/.cache/node_modules
/usr/lib/ccache/bin
/usr/bin/vendor_perl
/usr/bin/core_perl
/usr/bin/site_perl
$HOME/toolchain/bin
/root/.gem/ruby/2.6.0/bin
/shell/.gem/ruby/2.6.0/bin
/ext/opt/build-tools/29.0.2
/root/.cargo/bin
/ext/opt/crosstool-ng-build/bin
/ext/opt/platform-tools
/ext/opt/tools
/ext/opt/tools/bin
/ext/opt/android-ndk
/ext/opt/android-ndk/build/tools
/usr/lib/bash-utils
$(printf "%s\n" /ext/opt/build-tools/* | tail -n1)
/ext/opt/ndk-bundle
/ext/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin
/ext/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/aarch64-linux-gnu/bin
/usr/aarch64-linux-gnu/bin
$dot/bin
$dot/bin/final
$dot"
#$(printf "%s\n" /ext/opt/**/bin 2>/dev/null)
#path_file=/tmp/path.tmp
#if [[ ! -e $path_file ]]; then
#	printf "%s\n" /usr/lib/cw /usr/bin /usr/local/bin /usr/**/bin /home/**/bin /root/**/bin /opt/**/bin /sdk/**/bin /prog/**/bin /dot/**/bin /dot/bin/final /dot/slash/sbin | grep -v -e i686 -v -e mips -v -e lib -v -e twrp -v -e magisk >$path_file
#fi
#allpath="$(<$path_file)"
future_path=$(for tmp_path in $(echo -e ${allpath//:/\\n}); do
	[[ -d $tmp_path ]] || continue
	echo -n "$tmp_path:"
done)

if future_path_test="$($dot/bin/consolidate-path $future_path)"; then
	PATH="$future_path_test"
	cdpath="$($dot/bin/consolidate-path .:$AURDEST:/mnt:/last:/root:/usr:/etc:$HOME/.config:/etc/systemd:/usr/share:$PATH)"
else
	PATH="$future_path"
fi

export PATH cdpath

if [[ $1 == echo ]] || [[ $1 == print ]]; then
	echo export PATH=$PATH
fi
if sed -r "s|:+|:|g" <<<$PATH &>/dev/null; then
	PATH="$(sed -r "s|:+|:|g" <<<$PATH)"
fi
unset IFS future_path future_path_test cdpath consolidate
