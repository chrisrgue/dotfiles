# If running bash source .bashrc if possible
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"


for l_bindir in $HOME/.cargo/bin  $HOME/bin  $HOME/.local/bin  $HOME/dotfiles  $HOME/dotfiles/bin; do
    echo $PATH | grep -Eq "(^|:)${l_bindir}(:|)" || PATH=$l_bindir:$PATH
done


case "$-" in
    *i*) # Shell is interactive !!!

        # Ensure that 1 xautolock daemon is running which locks the screen after 10 minutes inactivity
        # ~/bin/xautolock.sh & # pgrep xautolock &>/dev/null && xautolock -exit; sleep 1 && xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &

        # pgrep xautolock &>/dev/null || xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &
        # xautolock -exit &>/dev/null
        # xautolock -time 10 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &

        # Start a reandom colorscript as a nice effect
        type colorscript &>/dev/null && colorscript random
        # colorscript -e $(colorscript -l | egrep -v '(colorbars|rupees|colortest|hex)' | shuf | head -n1 | awk '{print $2}')
        ;;
    *) # Shell is NOT interactive !!!
        # Ensure that 1 xautolock daemon is running which locks the screen after 10 minutes inactivity
        # pgrep xautolock &>/dev/null || xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &
        ;;
esac

