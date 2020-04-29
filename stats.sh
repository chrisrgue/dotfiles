#!/usr/bin/env bash

function dte() {
    echo "$(date +'%A, %B %d %l:%M%p')"
}

function hdd() {
    # echo "HDD: $(df -h | awk 'NR==4 {print $3, $5}')"
    echo "HDD: $(\df -h | egrep " /$" | awk '{print $3, $5}')"
}

function bat() {
    # echo "BAT: $(acpi -V | awk -F', ' 'NR==1 {print $2}')"
    echo "BAT: $(cat /sys/class/power_supply/BAT0/capacity)%"
}

function mem() {
    mem=$(\free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3/1024.0, $2/1024.0}')
    echo "MEM: $mem"
}

function mem_hungry_processes() {
    local n=${1:-10}
    ps axch -o cmd,%mem --sort=-%mem |head -n $n
}

function sysname() {
    echo "$(uname -nm)"
}

function cpu() {
    read cpu a b c previdle rest < /proc/stat
    prevtotoal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((199* ( (t0tal-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo "CPU: $cpu%"
}

function vol() {
    vol=$(amixer get Master | awk -F'[][]' 'END { print $4 ":" $2 }')
    echo "VOL: $vol"
}


function stats(){
    local color_tags_enabled=$1
    # Some unicodes entered by typing <C-S-U>x followed by hex code (gucharmap might help):
    # See https://unicode.org/emoji/charts/full-emoji-list.html#1f600
    # 😀  🦀  🌍  🏖  🏘  🗽  🚍  🚂  🛵  🚲  🛤  ⛽  🚦  ✈  ⌚   🌦  🔊  ☎  🔋  💾  💳  📧
    #  🔊
    # 📆  📎  ✂  🗄  🔒  🔐  🔑  ⚙  🔧  🧷  🧻  🚻  ⚠  ⛔  ☢  ☣  ☯  ⚕  ♻  ✔  ✅  💻    

    if [ "$color_tags_enabled" != "true" ]; then
        echo " 💻 [$(sysname)]  ⌚  [$(cpu)]  ✅  [$(bat)]  ✔  [$(mem)]  💾  [$(hdd)  🔊  [$(vol)]  📆  $(dte)"
    else
        echo "+@fg=1; +@fn=1; [$(sysname)] +@fn=0; [$(cpu)] +@fg=0; [$(mem)] +@fg=2; +@fn=1; [$(hdd)]  [$(vol)]  +@fn=0; +@fg=0;  $(dte)  "
    fi
}


[[ "${BASH_SOURCE[0]}" == "${0}" ]] && stats

