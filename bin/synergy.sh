#-*- coding: utf-8 -*-
#1#_SCRIPT_#1# - by: steelalive
#2#::.. Last edit: - Thu Aug  3 23:38:30 EDT 2017 - by: - steelalive - ..::## #_# - VERSION=0.0.4.4 - #_# #@#030817#@# #2#
#3#::..#####################_/dot/bin/synergy.sh_#######################..::#3#
if [[ $1 == reset || $1 == kill ]]; then
	stfu killall synergyc
	stfu killall synergys
	stfu killall synergy
fi
pgrep synergys &>/dev/null && exit 1
pgrep synergyc &>/dev/null && exit 2
pgrep synergy &>/dev/null && exit 99
[[ $HOSTNAME == PI ]] && /usr/bin/synergyc --debug ERROR --daemon --restart --name PI 192.168.0.100:24000
[[ $HOSTNAME == GA ]] && /usr/bin/synergys --debug ERROR --daemon --restart --name GA --config /dot/etc/synergy.conf --address 192.168.0.100:24000
