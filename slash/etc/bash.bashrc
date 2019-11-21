# system/etc/bash.bashrc
#
# Credits for this file and bash_logout go to the Bliss team and can be found at:
# https://github.com/BlissRoms/platform_external_bash/tree/n7.1-caf/etc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# set some environment variables
export HOME="/storage/????-????"
export TERM='xterm-256color'

# enable colorful terminal
. /system/etc/mk || . /system/system/etc/mk || . $sys/etc/mk
# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

resize
