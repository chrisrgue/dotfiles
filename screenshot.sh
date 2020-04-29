#!/bin/sh
#


mkdir -p ~/shots

screenshot() {
	case $1 in
	full)
		scrot -m -e 'mv $f ~/shots/'
		;;
	window)
		sleep 1
		scrot -s -e 'mv $f ~/shots/'
		;;
	*)
		;;
	esac;
}

screenshot $1
