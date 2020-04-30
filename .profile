# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


for l_bindir in  $HOME/bin  $HOME/.local/bin $HOME/dotfiles $HOME/dotfiles/bin $HOME/.cargo/bin; do
    echo $PATH | grep -Eq "(^|:)${l_bindir}(:|)"   ||   PATH=$l_bindir:$PATH
done


case "$-" in
    *i*) # Shell is interactive !!!

        # Ensure that 1 xautolock daemon is running which locks the screen after 10 minutes inactivity
		# ~/bin/xautolock.sh & # pgrep xautolock &>/dev/null && xautolock -exit; sleep 1 && xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &

        # pgrep xautolock &>/dev/null || xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &
        # xautolock -exit &>/dev/null
        # xautolock -time 10 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &

        # Start a reandom colorscript as a nice effect
        colorscript random
        # colorscript -e $(colorscript -l | egrep -v '(colorbars|rupees|colortest|hex)' | shuf | head -n1 | awk '{print $2}')
        ;;
    *) # Shell is NOT interactive !!!
        # Ensure that 1 xautolock daemon is running which locks the screen after 10 minutes inactivity
        # pgrep xautolock &>/dev/null || xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &
        ;;
esac


export PATH

# export PATH="$HOME/.cargo/bin:$PATH"
