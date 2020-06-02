#!/bin/sh

object=${1:-full}
verbose=$2

pics_dir=${PICS_DIR:-$HOME/Pictures/screenshots}
mkdir -p $pics_dir

screenshot() {
    case $object in
    full)
        scrot -m -e "mv \$f $pics_dir/"
        [ "$verbose" == "verbose" ] && ls -t $pics_dir/*.png | head -n 1 && read
        ;;
    window)
        sleep 1
        scrot -s -e "mv \$f $pics_dir/"
        [ "$verbose" == "verbose" ] && ls -t $pics_dir/*.png | head -n 1 && read
        ;;
    *)
        ;;
    esac;
}

screenshot $object
