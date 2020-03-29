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
if [[ -e "$dot/init.sh" ]]; then
	export dot
else
	[[ -e /data/dot/init.sh ]] && export dot=/data/dot
	[[ -e /dot/init.sh ]] && export dot=/dot
	[[ -e /system/dot/init.sh ]] && export dot=/system/dot
fi
[[ -e /dot ]] || ln -sri $dot /
shopt &>/dev/null || {
	echo "Sorry, this file is not compatible with ${SHELL}. You have to use bash.
Do you want to launch $(command -v bash 2>/dev/null)?
"
	yorn && $(command -v bash) -il --init-file $dot/init.sh || return 0
}

#sh $dot/bin/base16.bash
#[[ -e /etc/rc ]] && . /system/etc/rc

export dot_dir="$dot" dbin="$dot/bin" lux dot
export PATH="$PATH:$dot/bin:$dot/bin/final:$dot"

for i in $(command \ps aux | command \grep ps1bg.sh | command \grep -v grep | command \awk '{print $2}'); do kill -9 "$i"; done ##kill ps1 background process
unset android
is_android && android=android
. "$dot"/setpath.sh $android

src() {
	[[ -x "$lux"/usr/local/bin/bash ]] && builtin exec "$lux"/usr/local/bin/bash --init-file /etc/profile
	[[ -x "$slash/sbin/bash" ]] && builtin exec "$slash/sbin/bash" --init-file /etc/profile
	[[ -x "$lux"/usr/bin/bash ]] && "$lux"/usr/bin/bash --init-file /etc/profile
	echo "$lux/bin/bash is not there or something."
}

setenv() { export "$1=$2"; }
export -f setenv

export source_files="ps1.sh al.sh ps4.sh fn.sh init.sh ex.sh anset.sh setpath.sh"
#[[ -e /oem ]] && dot_files="$dot/slash/etc/mk"
unset dot_files
export dot_files="$dot/al.sh $dot/anset.sh /usr/share/LS_COLORS/dircolors.sh $dot/ex.sh $dot/fn.sh $dot/LESS_TERMCAP.sh  /usr/share/fzf/key-bindings.bash /usr/share/fzf/completion.bash /usr/share/git/git-prompt.sh /usr/share/git/completion/git-prompt.sh $dot/ps1.sh" # $dot/ps4.sh  #$dot/bin/goto.sh$HOME/.bash_prompt

[[ -e /oem ]] || dot_files="$dot_files $dot/ps1bg.sh"
echo
printf "%b" "\x1b[1;38;5;24m ##########################\x1b[1;38;2;0;255;255m$(command -v $0)\x1b[1;38;5;24m ########################## \x1b[0m\n"
for this in $dot_files; do
	[[ -r $this ]] && "$dot"/bin/linerl "\x1b[1;38;2;0;255;191m$this\x1b[1;38;2;30;144;99m-->Sourcing...\x1b[0m" && source "$this"
	exit_code=$?
	[[ $exit_code == 0 ]] && "$dot"/bin/linerl "\x1b[1;38;2;0;255;255m$this\x1b[1;38;2;30;144;255m-->Succesfully sourced!\x1b[0m" $exit_code || printf "%b" "${RED}Cannot source $this\\n"
done
printf %b "\x1b[1;38;5;24m ##########################\x1b[1;38;2;0;255;255m$(command -v $0)\x1b[1;38;5;24m ########################## \x1b[0m\\n\\n"
[[ -e /oem ]] && . $dot/setpath.sh android
is_there /tmp/ssh-agent && . /tmp/ssh-agent &>/dev/null
unalias ps
unset IFS info this_4_real this future_path futur_path_test dot_files
(
	pkill ps1bg.sh ps1_writer &>/dev/null
) &>/dev/null
killjobs
ps1_writer &
disown &>/dev/null
is_there "$dot/.dir_colors" && is_in_path dircolors &>/dev/null && eval $(dircolors --sh "$dot/.dir_colors")
is_in_path archey && archey
is_in_path fortunes &>/dev/null && fortunes
[[ -e /oem ]] && . "$dot/setpath.sh" android

[[ $meteo_done ]] || neofetch && export meteo_done=1 && cd / && ls
src_post.bash
