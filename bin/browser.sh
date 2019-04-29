#!/bin/bash
#-*- coding: utf-8 -*-
#1#_SCRIPT_#1#
#2#::.. Last edit: - Wed Jun  7 01:34:44 EDT 2017 - by: -  - ..::## #_# - VERSION=0.0.0.2 - #_# #@#070617#@# #2#
#3#::..#####################_/dot/bin/browser.sh_#######################..::#3#
/usr/bin/chromium %U --user-data-dir="/home/master/.config/chromium" --no-proxy-server "$@"
