#!/usr/bin/env bash
# Litte utility used in ~/.spectrwm.conf to workaround race conditions during AUTORUN
# Ex:
# autorun = ws[1]:/usr/local/bin/sleep-and-run.sh 2s /usr/bin/gvim + -c startinsert ~/.spectrwm.conf

# sleep $1
# $("${@:2}")

[[ $# < 2 ]] && echo "Usage: $0 <TOUT_SECCONDS> <CMD> [<ARGS>]*" >&2 && exit 1

sleep $1
shift
eval "$@"

