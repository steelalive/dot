case $- in
*i*) ;;
*) exit 0 ;;
esac

[ -z "$PS1" ] && return
shopt &>/dev/null || return 0

if [[ $UID -gt 199 ]] && [[ "$(id -gn)" == "$(id -un)" ]]; then
	umask 002
else
	umask 022
fi

dot="$(dirname "${BASH_SOURCE[0]}")"
[[ -e /dot ]]  || ln -sri $dot /
if [[ -e "$dot/init.sh" ]]; then
	export dot
else
	[[ -e /dot/init.sh ]] && dot=/dot
	[[ -e /data/dot/init.sh ]] && dot=/data/dot
fi

[[ -e /system/etc/rc ]] && . /system/etc/rc

[[ "$lux" ]] || lux=
export dot_dir="$dot" dbin="$dot/bin" lux dot
export PATH="$PATH:$dot/bin:$dot/bin/final:$dot"
[[ $1 == "-bare" ]] && return
. "$dot"/setpath.sh

src() {
	[[ -x "$lux"/usr/local/bin/bash ]] && builtin exec "$lux"/usr/local/bin/bash --init-file /etc/profile
	[[ -x "$slash/sbin/bash" ]] && builtin exec "$slash/sbin/bash" --init-file /etc/profile
	[[ -x "$lux"/usr/bin/bash ]] && "$lux"/usr/bin/bash --init-file /etc/profile
	echo "$lux/bin/bash is not there or something."
}

setenv() { export "$1=$2"; }
export -f setenv
for i in $(command \ps aux | command \grep ps1bg.sh | command \grep -v grep | command \awk '{print $2}'); do kill -9 "$i"; done

export source_files="ps1.sh al.sh ps4.sh fn.sh init.sh ex.sh anset.sh setpath.sh"
export dot_files="$dot/al.sh $dot/anset.sh $dot/ex.sh $dot/fn.sh $dot/LESS_TERMCAP.sh $dot/ps1.sh $dot/ps1bg.sh" # $dot/ps4.sh  #$dot/bin/goto.sh
[[ -e /oem ]] && dot_files="$dot_files $dot/g4.sh $dot/anset.sh"
[[ -e /oem ]] || dot_files="$dot_files $dot/ps1bg.sh"
echo
printf "%b" "\x1b[1;38;5;24m ##########################\x1b[1;38;2;0;255;255m$(command -v $0)\x1b[1;38;5;24m ########################## \x1b[0m\n"
for this in $dot_files; do
	[[ -r $this ]] && source "$this"
	exit_code=$?
	"$dot"/bin/linerl "\x1b[1;38;2;0;255;255m$this\x1b[1;38;2;30;144;255m-->Sourced...\x1b[0m" $exit_code
	[[ -r $this ]] || printf "%b" "${RED}Cannot source $this\\n"
done
printf %b "\x1b[1;38;5;24m ##########################\x1b[1;38;2;0;255;255m$(command -v $0)\x1b[1;38;5;24m ########################## \x1b[0m\\n\\n"

is_there /tmp/ssh-agent && . /tmp/ssh-agent &>/dev/null
is_in_path env_parallel.bash && . "$(command -v env_parallel.bash)"
unalias ps
killjobs
unset IFS info this_4_real this future_path futur_path_test
(
	pkill ps1bg.sh &>/dev/null
) &>/dev/null
[[ "$(tty 2>/dev/null)" =~ tty ]] || ps1_writer & disown
if [[ -e /oem ]]; then
	[[ -x /bin/nano ]] && export EDITOR="/bin/nano --syntax bash"
fi
(ps1_writer &)
is_there "$dot/.dir_colors" && is_in_path dircolors &>/dev/null && eval $(dircolors --sh "$dot"/.dir_colors 2>/dev/null)
is_in_path archey && archey
hash fortunes &>/dev/null && fortunes
. "$dot/setpath.sh"
