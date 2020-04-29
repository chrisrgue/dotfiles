#!/usr/bin/env bash
##########################################################################################
# Author:  Christian Günther
# Purpose: This script is launched by spectrwm to continously configure SPECTRWM*s autobar
##########################################################################################
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
tout=$1               && [ -z $tout ]               && tout=10
color_tags_enabled=$2 && [ -z $color_tags_enabled ] && color_tags_enabled=false

source "$dir/../dotfiles/stats.sh"

while :; do
    dt=$(date +"%a  %d.%m.%Y  %H:%M")
    stats $color_tags_enabled
    sleep $tout
done
