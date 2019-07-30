#!/bin/bash
#2#::.. Last edit: - Thu May 31 13:08:44 EDT 2018 - by: - steelalive - ..::## #_# - VERSION=0.8.9.1 - #_# #@#310518#@# #2#
#3#::..#####################_MAIN_#######################..::#3#
#p || $dot/bin/wp
dot=${dot:-/dot}
if [[ $SHELL = *bash* ]]; then
	#[[ -e /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
	complete -d d
	for set_plus in noclobber notify monitor histexpand; do set +o "$set_plus"; done
	for set_minus in ignoreeof hashall pipefail emacs interactive-comments; do set -o "$set_minus"; done
	for shopt_opt in gnu_errfmt lastpipe direxpand autocd cdable_vars cdspell checkwinsize checkhash cmdhist dirspell extglob globstar histappend histreedit histverify hostcomplete huponexit interactive_comments mailwarn nocaseglob nocasematch no_empty_cmd_completion nullglob progcomp promptvars sourcepath execfail lithist; do
		builtin shopt -s "$shopt_opt" &>/dev/null
	done
	enable -a &>/dev/null
	unset shopt_opt set_minus set_plus
	is_in_path hh && bind '"\C-r": "\C-a hh \C-j"'
fi
is_pc && is_root && {
	#zip -urq /last/BACKUP/etc.zip /etc &>/dev/null
	#zip -urq /last/BACKUP/dot.zip /dot &>/dev/nullglob
	if tty | grep 1 &>/dev/null; then
		zip -rq -FS /last/dot.zip /dot
	fi
}
is_android && {
	[[ -e $lux ]] && zip -rq -FS $ex/dot.zip /data/dot
}

set -a
eval "$(dircolors --sh $dot/.dir_colors)"
if [[ ! -e /tmp/INIT ]] && is_root && [[ ! -e /oem ]] && is_pc; then
	
	NET=wlan0
	$dot/bin/wp
	touch /tmp/INIT
	mkdir -p /tmp &>/dev/null
	sysctl --load="$dot"/etc/sysctl.d/98-sysctl.conf &>/dev/null
	(("$(</proc/sys/kernel/sysrq)" == 1)) || echo 1 >>/proc/sys/kernel/sysrq 2>/dev/null
	#[[ -e /usr/lib/systemd/system/getty@.service ]] && sed -i "s|ExecStart=-/sbin/agetty -o.*|ExecStart=-/sbin/agetty --noclear -a shell %I $TERM|" /usr/lib/systemd/system/getty@.service
	[[ -e "$dot/bin/initmnt" ]] && "$dot/bin/initmnt"
	[[ -e /sys/devices/system/memory/power/async ]] && echo enabled >/sys/devices/system/memory/power/async
	is_in_path dbus-launch && eval "$(dbus-launch 2>/dev/null)"
	if tty | grep 1 &>/dev/null; then
		zip -rq -FS /last/BACKUP/etc.zip /etc &>/dev/null
		zip -rq -FS /last/BACKUP/dot.zip /dot &>/dev/null
	fi
#	mount /dev/sda4 /boot
	#for i in /dot/etc/cron.daily/*; do
	#	ANBB "Daily task $i ...${R}\n"
	#	bash $i
	#done
	#tar -cf /last/dot.tar ${dot} &>/dev/null
	#+all /dot
	ANBG "One-time init completed.$R\\n"
fi

pgrep ssh-agent &>/dev/null || ssh-agent >/tmp/ssh-agent 2>/dev/null

if [[ $HOSTNAME == PC ]]; then
	SSH_KEY_PATH="/root/.ssh/id_rsa"
	#	rs /dot /last/Acreation/ &>/dev/null
	stfu ssh-add "$SSH_KEY_PATH"
fi

if [[ $HOSTNAME == TV ]]; then
	SSH_KEY_PATH="/root/.ssh/tv_rsa"
	stfu ssh-add "$SSH_KEY_PATH"
fi

if [[ $HOSTNAME == G4 ]]; then
	SSH_KEY_PATH="/root/.ssh/g4_rsa"
	stfu ssh-add "$SSH_KEY_PATH"
	#	stfu ssh-add $dot/root/.ssh/g4_rsa
fi

if ! findmnt /last &>/dev/null; then
	mkdir /last &>/dev/null
	mount LABEL=LAST-GA /last &>/dev/null && ANG "LAST-GA mounted"
fi


###############################shopt and shits##############################################
is_there "$dot/.dir_colors" && is_in_path dircolors &>/dev/null && eval "$(dircolors --sh "$dot"/.dir_colors 2>/dev/null)"
#is_there /usr/lib/libstderred.so && LD_PRELOAD="/usr/lib/libstderred.so"	STDERRED_ESC_CODE=$(ANRED)	STDERRED_BLACKLIST="^(test.*)$"i
is_in_path colordiff &>/dev/null && alias diff="colordiff"
is_in_path iwgetid && SSID="$(iwgetid -r 2>/dev/null)"
is_in_path setterm && setterm --term "$TERM"
is_in_path lomoco && stfu lomoco --800
is_in_path ls++ && LSPLUS="${LSPLUS:-$(command -v ls++) --potsf --color=auto --ignore-backups --time-style=+%d.%m.%Y--%H:%M --group-directories-first --classify --ignore-backups --almost-all --escape --human-readable -L --dereference-command-line}"
is_in_path ls++ || LSPLUS="command ls $LS_OPTIONS"
is_in_path nproc && COMPRESSXZ="xz -c -z - --threads=$(nproc --all)"
is_in_path numlockx && stfu numlockx
is_in_path nvim && EDITOR="$(command -v nvim)" && alias vim="$EDITOR"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
VISUAL="$EDITOR"
is_in_path src-highlight-lesspipe.sh && LESSOPEN="| src-hilite-lesspipe.sh %s"
is_in_path stty && LINES="$(stty size | cut -d' ' -f1)" COLUMNS="$(stty size | cut -d' ' -f2)"
is_in_path stty && stty stop undef && stty stop '' && stty start '' && stty -ixon && stty -ixoff &>/dev/null
is_in_path tput && SCREEN_COLORS="$SCREEN_COLORS:-$(tput colors 2>/dev/null)"
is_in_path xhost && stfu xhost +local:local
is_in_path xset && stfu xset r rate 300 40 && stfu xset dpms 600 1800 10000 && stfu xset s 500 &>/dev/null
is_there "/usr/lib/cw/dmesg" && rm /usr/lib/cw/dmesg
[[ $HOSTNAME == PC ]] && is_there /tmp/ssh-agent && eval "$(head -n2 /tmp/ssh-agent)"
is_in_path dbus-launch && test -z "$DBUS_SESSION_BUS_ADDRESS" && [[ ! -e /oem ]] && eval "$(dbus-launch --sh-syntax --exit-with-session 2>/dev/null)"
if [[ "$SSH_CLIENT" ]]; then
	export DISPLAY=:0.0
	stfu xhost +local:local
fi
ulimit -S -n 1024
stfu ulimit -S -c 0
[[ "$(tty 2>/dev/null)" =~ tty ]] && export EDITOR=nano && export VISUAL=nano
#is_in_path yay && for pacfolders in AURDEST SRCDEST SRCPKGDEST EXPORTSRC SRCPKGDEST; do
#	folder="/ext/yay/$pacfolders"
#	[[ $pacfolders == PKGDEST ]] && folder=/last/pacman/PKGDEST
##	[[ $pacfolders == SRCDEST ]] && folder=/last/pacman/SRCDEST
#	declare -x "${pacfolders}=${folder}"
#	if [[ ! -e $folder ]]; then
#		mkdir -p "$folder"
#		chmod 755 -R "$folder" 2>/dev/null
#		+user -R "$folder" 2>/dev/null
#	fi
 #one

is_in_path xdg-user-dirs-update && XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}" \
	XDG_CACHE_HOME="$HOME/.cache" XDG_DATA_HOME="$HOME/.local/share" XDG_CONFIG_DIRS=/etc/xdg \
	XDG_DATA_DIRS=/usr/share XDG_DESKTOP_DIR="$HOME/Desktop" XDG_MUSIC_DIR=/last/mp3 \
	XDG_PICTURES_DIR=/last/wallpapers && mkdir -p "$HOME"/doc && \
	for i in XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR XDG_DOCUMENTS_DIR XDG_VIDEOS_DIR; do
	declare -x "$i=$HOME/doc"
done

[[ -e /last/Downloads ]] && XDG_DOWNLOAD_DIR=/last/Downloads
is_in_path xdg-user-dirs-update && {
	XDG_RUNTIME_DIR=/run/user/"$UID"
	stfu mkdir -p /run/user/"$UID" "$XDG_RUNTIME_DIR" "$HOME/doc"
	xdg-user-dirs-update
	chown 1000 -R /run/user/1000 &>/dev/null
}
is_root is_in_path localectl && for locale in LC_COLLATE LC_MEASUREMENT LC_NAME LC_TELEPHONE LANGUAGE LC_CTYPE LC_MESSAGES LC_NUMERIC LC_TIME LC_ADDRESS LC_IDENTIFICATION LC_MONETARY LC_PAPER; do localectl set-locale "$locale"=en_CA.UTF-8; done
is_in_path locale-gen && echo " " >/etc/locale.conf && for loc in LANG LC_CTYPE LC_NUMERIC LC_TIME LC_MONETARY LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION; do
	eval export "$loc=en_CA.UTF-8" &>/dev/null
	echo "$loc=en_CA.UTF-8" >>/etc/locale.conf
done

: "${MANPATH=$(manpath 2>/dev/null)}"
ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8G"
ARG10='arg0 Arg1 aRg2 arG3 ARG4 arg5 ArG6 arg7 arg8 arg9 arg10 ARG11'
BACKUP="/last/BACKUP"
BASH="${BASH:-$(command -v bash 2>/dev/null)}"
BROADCAST='192.168.0.1'
BUILDDIR='/tmp/makepkg'
BROWSER='lynx -dump'
CCACHE_DIR="/var/.ccache"
CCACHE_TEMPDIR="/tmp/.ccache"
CHEATCOLORS='true'
COLORFGBG='default;default'
COLORTERM='truecolors'
COMP_CONFIGURE_HINTS=1
CW_USEPTY=1
REPO_OS_OVERRIDE='linux'
DBUS_SYSTEM_BUS_ADDRESS='unix:path=/run/dbus/system_bus_socket'
DMENU_OPTIONS='-nb white -nf black -sb #AAAAAA -sf white'
EXTRACT_UNSAFE_SYMLINKS=1
tmp_serial='/tmp/adbserial'
src=${src:-/ext/src}
O=${O:-/ext/out}
FCEDIT='nano'
FORCE_UNSAFE_CONFIGURE=1
FREEOPERTIES='truetype:interpreter-version=38'
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01;33:quote=01;34'
GEGL_USE_OPENCL='yes'
QUOTING_STYLE='shell-escape'
GIT_PROMPT_ONLY_IN_REPO='true'
GIT_PS1_HIDE_IF_PWD_IGNORED='true'
GIT_PS1_SHOWCOLORHINTS='true'
GIT_PS1_SHOWDIRTYSTATE='true'
GIT_PS1_SHOWUPSTREAM='auto'
CGO_CFLAGS="-g -Ofast -O3 -O2"
CGO_CXXFLAGS="-g -Ofast -O3 -O2"
CGO_FFLAGS="-g -Ofast -O3 -O2"
CGO_LDFLAGS="-g -Ofast -O3 -O2"
GIT_PROMPT_COMMAND_FAIL="😠 ${Red}✘ "
GIT_PROMPT_COMMAND_OK="😊 ${Green}✔  "
CHARSET=UTF-8
result="$(printf "%s" $O/target/product/*)"
CPPFLAGS="-O3"
FCFLAGS="-g -O3"
FFLAGS="-g -O3"
CFLAGS="-march=native -O3 -pipe -m64 -fno-plt --param=ssp-buffer-size=4 "
CXXFLAGS="$CFLAGS -ftree-vectorize"
LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
CC='/usr/bin/zapcc'
CXX='/usr/bin/zapcc++'
MAKEFLAGS="-j$(nproc --all)"
DEBUG_CFLAGS="-g -fvar-tracking-assignments"
DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
GREP_COLORS='ms=38;5;226:mc=02;33:sl=01;37:cx=01;36:fn=35:ln=32:bn=32:se=36'
JAVA_HOME=/usr/lib/jvm/default
HH_CONFIG='hicolor'
HIGHLIGHT_DATADIR='/usr/share/highlight'
HISTCONTROL='ignoreboth:erasedups'
HISTFILE="$dot/.histfile"
HISTFILESIZE=500000
HISTIGNORE='&:exit'
HISTSIZE=500000
HOST="${HOST:-$(hostname)}" HOSTNAME="$HOST"
HOME="${HOME:-/root}"
HOSTFILE="${HOSTFILE:-$HOME/.ssh/known_hosts}"
IGNOREEOF='2'
JACK_SERVER_VM_ARGUMENTS='-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx10096m'
INPUTRC="${INPUTRC:-$dot/root/.inputrc}"
LAN="$(if ip link | grep eth &>/dev/null; then ip link | grep -o -E "eth[0-9]" | cut -d: -f2; fi)"
LANGUAGE='en_US'
LC_COLLATE='C'
LESS=' -R'
LESSCOLOR='auto'
LESSCOLORIZER='pygmentize'
LESSHISTFILE=-
LESSOPEN="| $(command -v highlight) %s --quit-if-one-screen --out-format truecolor --quiet --force --style candy --syntax bash"
LOGDEST="$BUILDDIR"
LS_COLLATE='C'
LD_LIBRARY_PATH='/usr/lib:/usr/local/lib' 
ldconfig
[[ $HOSTNAME == PC ]] && LS_OPTIONS=' -l --color=auto --quoting-style=shell-escape --ignore-backups --group-directories-first --file-type --almost-all --human-readable -L'
MALLOC_CHECK_=3
MALLOC_PERTURB_=$((RANDOM % 255 + 1))
MANPAGER='less'
MOST_EDITOR="$EDITOR %s %d"
NETMASK='255.255.255.0'
NOCOLOR_PIPE=1
PACKAGER="${PACKAGER:-steelalive}"
PAGER='less'
QT_LOGGING_RULES="*=false"
RESOLV_MULTI='on'
RESOLV_REORDER='on'
RESOLV_SPOOF_CHECK='off'
SCREEN_COLORS='256'
SHELL="${SHELL:-$(command -v bash 2>/dev/null || command -v sh 2>/dev/null)}"
SHELLCHECK_OPTS='--shell=bash --exclude=SC1001,SC2016,SC2034,SC2154,SC2120,SC2054,SC1090,SC1091,SC2001,SC2086,SC2162,SC2139'
SOURCE_HIGHLIGHT_DATADIR="/usr/share/source-highlight"
SYSTEMD_PAGER="$PAGER"
TERM='xterm-256color'
TERM_AUDIO=enabled
TERM_COLOR=16m
TERM_FONT=full
TERM_ENHANCED=enabled
TERM_IMAGE=enabled
TMOUT=90000
TZ=:/etc/localtime
USECOLOR=1
USER="${USER:-$(whoami 2>/dev/null || whoami 2>/dev/null)}"
USE_CCACHE=1
QT_X11_NO_MITSHM=1
USE_PREBUILT_CHROMIUM=1
VISUAL="$EDITOR"
WIRELESS_REGDOM='DE'
kernel="${kernel:-$src/kernel/samsung/exynos7420}"
WPCONF="$dot/bin/wpa_supplicant.conf"
WWW_HOME='http://www.google.com/ncr'
XZ_OPT='-T 0'
_5=$'\137\137\137\137\137\137\137\137\137\137\137\137\137\137\137'
alias less='less -m -g -i -J --underline-special'
alias more='less'
XDG_CACHE_HOME="$HOME/.cache"
auto_resume=1
broadcast='192.168.0.1'

chmod 777 /tmp/loadcpu /tmp/prompt /tmp/START.1 2>/dev/null
chromium="/usr/bin/chromium --disk-cache-dir=/tmp/profile-sync-daemon --scroll-pixels=600 --disk-cache-size=629145600 --memory-model=high --password-store=basic --no-proxy-server --user-data-dir=/root/.config/chromium %U"
force_color_prompt=yes
hotmail='demers.francis@hotmail.com'
netmask='255.255.255.0'
no_proxy='localhost,127.0.0.1,localaddress,.localdomain.com'
pc='192.168.0.20'
tv='192.168.0.9'
cell='192.168.0.120'
#[[ ! -e /oem ]] && ex="$(ad ex 2>/dev/null)"
[[ -e "$dot"/slash ]] && export slash="$dot"/slash
[[ -e "$dot"/bin/wp ]] && eval "$(grep -m1 'WPCONF' "$dot"/bin/wp | sed 's/\[\[.*&& //')"
[[ -e /last ]] && last=/last

touch /tmp/loadcpu /tmp/prompt /tmp/START.1 &>/dev/null
unset http_proxy https_proxy ftp_proxy rsync_proxy
declare -ax ARR10=("${ARG10[@]}")

if [[ -e /usr/share/terminfo ]]; then
	TERMINFO=/usr/share/terminfo
else
	[[ -e /system/etc/terminfo ]] && TERMINFO=/system/etc/terminfo
	[[ -e /sbin/terminfo ]] && TERMINFO=/sbin/terminfo
	[[ -e /sbin/x ]] && TERMINFO=/sbin
fi

TMP=/tmp
TMPDIR="$TMP"
mkdir -p "$TMP" || TMP="$HOME"/tmp
set +a
if [[ $HOSTNAME == PC ]]; then
	case "$(ip link | command grep -o -E "wlan[0-9]" | wc -l)" in 4) NET=wlan3 ;; 3) NET=wlan2 ;; 2) NET=wlan1 ;; 1) NET=wlan0 ;; *) echo no wireless ;; esac
	if ip link | grep -o "wlp.*:" &>/dev/null; then NET="$(ip link | grep -o "wlp.*:" | sed "s/://")"; fi
	if ip link | grep "24:05:0f:ea:36:6c" &>/dev/null; then
		NET="$(ip link | grep "24:05:0f:ea:36:6c" --before-context=1 | head -n1 | awk '{print $2}' | sed 's/://')"
		#which_network 5G
	fi
fi
#export NET=eth0
# vi: set noro: ft=sh
# Check for interactive bash and that we haven't already been sourced.
if [ -n "${BASH_VERSION-}" -a -n "${PS1-}" -a -z "${BASH_COMPLETION_COMPAT_DIR-}" ]; then

	# Check for recent enough version of bash.
	if [ "${BASH_VERSINFO[0]}" -gt 4 ] ||
		[ "${BASH_VERSINFO[0]}" -eq 4 -a "${BASH_VERSINFO[1]}" -ge 1 ]; then
		[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion" ] &&
			. "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion"
		if shopt -q progcomp && [ -r /usr/local/share/bash-completion/bash_completion ]; then
			# Source completion code.
			[[ -e /usr/local/share/bash-completion/bash_completion ]] && . /usr/local/share/bash-completion/bash_completion
			. /usr/share/bash-completion/bash_completion
		fi
	fi

fi
