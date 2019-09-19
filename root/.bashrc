#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term="${TERM//[^[:alnum:]]/?}" # sanitize TERM
match_lhs=""
[[ -f /dot/.dir_colors ]] && match_lhs="$match_lhs$(</dot/.dir_colors)"
[[ -f $dot/.dir_colors ]] && match_lhs="$match_lhs$(<$dot/.dir_colors)"
[[ -z $match_lhs ]] &&
	type -P dircolors >/dev/null &&
	match_lhs="$(dircolors --print-database)"
[[ $'\n'"$match_lhs" == *$'\n'"TERM ""$safe_term"* ]] && use_color=true

#if ${use_color} ; then
# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if type -P dircolors >/dev/null; then
	if [[ -f /dot/.dir_colors ]]; then
		eval "$(dircolors -b ~/.dir_colors)"
	elif [[ -f $dot/.dit_colors ]]; then
		eval "$(dircolors -b /etc/DIR_COLORS)"
	fi
fi

#	alias ls='ls --color=auto'
#	alias grep='grep --colour=auto'
#	alias egrep='egrep --colour=auto'
#	alias fgrep='fgrep --colour=auto'
#else
#if [[ ${EUID} == 0 ]] ; then
#	# show root@ when we don't have colors
#	PS1='\u@\h \W \$ '
#else
#	PS1='\u@\h \w \$ '
#fi
#fi

unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
#alias more=less

xhost +local:root >/dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

export QT_SELECT=5

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# better yaourt colors
src() {
	appendpath '/dot/bin'
	appendpath '/dot/bin/final'
	[[ $USER == arch ]] && return
	[[ $USER == root ]] || exec sudo su - -l --shell /usr/local/bin/bash
	[[ $USER == root ]] && . /dot/init.sh
}

export ANDROID_HOME=/ext/opt/android-sdk
# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt
