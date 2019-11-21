case $- in
*i*) ;;
*) exit 0 ;;
esac

[ -z "$PS1" ] && return

if [[ $UID -gt 199 ]] && [[ "$(id -gn)" == "$(id -un)" ]]; then
	umask 002
else
	umask 022
fi

dot="$(dirname "${BASH_SOURCE[0]}")"
[[ -e /dot ]] || ln -sri $dot /
if [[ -e "$dot/init.sh" ]]; then
	export dot
else
	[[ -e /dot/init.sh ]] && dot=/dot
	[[ -e /data/dot/init.sh ]] && dot=/data/dot
fi
shopt &>/dev/null || {
	echo "Sorry, this file is not compatible with ${SHELL}. You have to use bash.
Do you want to launch $(command -v bash 2>/dev/null)?
"
	yorn && $(command -v bash) -il --init-file $dot/init.sh || return 0
}

sh $dot/bin/base16.bash
[[ -e /system/etc/rc ]] && . /system/etc/rc

export dot_dir="$dot" dbin="$dot/bin" lux dot
export PATH="$PATH:$dot/bin:$dot/bin/final:$dot"

for i in $(command \ps aux | command \grep ps1bg.sh | command \grep -v grep | command \awk '{print $2}'); do kill -9 "$i"; done ##kill ps1 background process

. "$dot"/setpath.sh

src() {
	[[ -x "$lux"/usr/local/bin/bash ]] && builtin exec "$lux"/usr/local/bin/bash --init-file /etc/profile
	[[ -x "$slash/sbin/bash" ]] && builtin exec "$slash/sbin/bash" --init-file /etc/profile
	[[ -x "$lux"/usr/bin/bash ]] && "$lux"/usr/bin/bash --init-file /etc/profile
	echo "$lux/bin/bash is not there or something."
}

setenv() { export "$1=$2"; }
export -f setenv

export source_files="ps1.sh al.sh ps4.sh fn.sh init.sh ex.sh anset.sh setpath.sh"
export dot_files="$dot/al.sh $dot/anset.sh $dot/ex.sh $dot/fn.sh $dot/LESS_TERMCAP.sh $dot/ps1.sh $HOME/.bash_prompt /usr/share/fzf/key-bindings.bash /usr/share/fzf/completion.bash /usr/share/git/git-prompt.sh /usr/share/git/completion/git-prompt.sh" # $dot/ps4.sh  #$dot/bin/goto.sh

[[ -e /oem ]] && dot_files="$dot_files $dot/g4.sh $dot/anset.sh"
[[ -e /oem ]] || dot_files="$dot_files $dot/ps1bg.sh"
echo
printf "%b" "\x1b[1;38;5;24m ##########################\x1b[1;38;2;0;255;255m$(command -v $0)\x1b[1;38;5;24m ########################## \x1b[0m\n"
for this in $dot_files; do
	[[ -r $this ]] && source "$this"
	exit_code=$?
	"$dot"/bin/linerl "\x1b[1;38;2;0;255;255m$this\x1b[1;38;2;30;144;255m-->Sourced...\x1b[0m" $exit_code || printf "%b" "${RED}Cannot source $this\\n"
done
printf %b "\x1b[1;38;5;24m ##########################\x1b[1;38;2;0;255;255m$(command -v $0)\x1b[1;38;5;24m ########################## \x1b[0m\\n\\n"

is_there /tmp/ssh-agent && . /tmp/ssh-agent &>/dev/null
unalias ps
unset IFS info this_4_real this future_path futur_path_test
(
	pkill ps1bg.sh ps1_writer &>/dev/null
) &>/dev/null
killjobs
if [[ -e /oem ]]; then
	[[ -x /bin/nano ]] && export EDITOR="/bin/nano --syntax bash"
fi
ps1_writer &
disown &>/dev/null
is_there "$dot/.dir_colors" && is_in_path dircolors &>/dev/null && eval "$(dircolors --sh "$dot/.dir_colors")"
is_in_path archey && archey
is_in_path fortunes &>/dev/null && fortunes
. "$dot/setpath.sh"
[[ $meteo_done ]] || neofetch && export meteo_done=1 && cd / && ls
src_post.bash
