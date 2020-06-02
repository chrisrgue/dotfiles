#!/bin/sh
#

pics_dir=${PICS_DIR:=$HOME/Pictures/screenshots}
mkdir -p $pics_dir

screenshot() {
	case $1 in
	full)
		scrot -m -e 'mv $f $pics_dir'
		;;
	window)
		sleep 1
		scrot -s -e 'mv $f $pics_dir'
		;;
	*)
		;;
	esac;
}

screenshot $1
