#!/bin/bash
# ---------------------------------------------------------------------------
# this - test

# Copyright 2018,  <root@PC>
# All rights reserved.

# Usage: this [-h|--help] [-h|--help] [-q|--quit]

# Revision history:
# 2018-03-20 Created by script_gen ver. 3.3
# ---------------------------------------------------------------------------

PROGNAME=${0##*/}
VERSION="0.1"

clean_up() { # Perform pre-exit housekeeping
	return
}

error_exit() {
	echo -e "${PROGNAME}: ${1:-"Unknown Error"}" >&2
	clean_up
	exit 1
}

graceful_exit() {
	clean_up
	exit
}

signal_exit() { # Handle trapped signals
	case $1 in
	INT)
		error_exit "Program interrupted by user"
		;;
	TERM)
		echo -e "\n$PROGNAME: Program terminated" >&2
		graceful_exit
		;;
	*)
		error_exit "$PROGNAME: Terminating on unknown signal"
		;;
	esac
}

usage() {
	echo -e "Usage: $PROGNAME [-h|--help] [-h|--help] [-q|--quit]"
}

help_message() {
	cat <<-_EOF_
		  $PROGNAME ver. $VERSION
		  test
		
		  $(usage)
		
		  Options:
		  -h, --help  Display this help message and exit.
		  -h, --help  help
		  -q, --quit  quit
		
		  NOTE: You must be the superuser to run this script.
		
	_EOF_
	return
}

# Trap signals
trap "signal_exit TERM" TERM HUP
trap "signal_exit INT" INT

# Check for root UID
if [[ $(id -u) != 0 ]]; then
	error_exit "You must be the superuser to run this script."
fi

# Parse command-line
while [[ -n $1 ]]; do
	case $1 in
	-h | --help)
		help_message
		graceful_exit
		;;
	-h | --help)
		echo "help"
		;;
	-q | --quit)
		echo "quit"
		;;
	-* | --*)
		usage
		error_exit "Unknown option $1"
		;;
	*)
		echo "Argument $1 to process..."
		;;
	esac
	shift
done

# Main logic

graceful_exit
