#!/usr/bin/env bash
# Author: Christian Günther
# Ensure that 1 xautolock daemon is running which locks the screen after specified (default=15) minutes inactivity
# pgrep xautolock &>/dev/null && xautolock -exit

mins=${1:-15} && pgrep xautolock &>/dev/null ||                                                       \
    exec xautolock                                                                   \
	    -detectsleep                                                                 \
	    -time $mins                                                                  \
	    -locker "slock"                                                              \
	    -corners '++++'                                                              \
	    -cornersize 40                                                               \
	    -cornerdelay 6                                                               \
	    -cornerredelay 30                                                            \
	    -notify 5                                                                    \
	    -notifier "notify-send -t 5000 -- 'About to lock screen ...'"


