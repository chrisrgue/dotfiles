# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[[ $TMUX = "" ]] && export TERM="xterm-256color"

################################################################################
# Start tmux on every shell login
# Make sure that:
#  (1) tmux exists on the system,
#  (2) we're in an interactive shell, and
#  (3) tmux doesn't try to run within itself:
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -2
fi
################################################################################

# Disable C-S behavior in terminal (in vimrc it will be mapped to update (=save file))
[[ -t 0 && $- = *i* ]] && stty -ixon


# Use <C-O> (instead of <C-z> (default) for backgrounding)
# in ".vimrc" <C-z> will be mapped to "Zoom current split"
stty susp 

###################### EXPORTS #########################################
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

export CG_SHARED_HOME=$HOME/cg__shared_folders
export HOME_DOTCONFIG=$HOME/.config
export GMAIL_ADDR="christianr.guenther@gmail.com"

# To stop ranger from loading both the default and your custom rc.conf,
# please set the environment variable RANGER_LOAD_DEFAULT_RC to FALSE.
export RANGER_LOAD_DEFAULT_RC=false

# Language settings
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# GCC output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
###################### EXPORTS #########################################

# default EDITOR
export EDITOR=nvim
export VISUAL=nvim

# setup nvim as default pager (f9r man pages)
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
        vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
            -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
                -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""



###################### OPTIONS #########################################
# Use vi mode (instead of emacs mode: set -o emacs)
# set -o vi

# append to the history file, don't overwrite it
shopt -s histappend

# Automatically change directory by only typing the <DIR> (i.e. without typing the 'cd' command)
# shopt -s autocd

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
purple='\[\e[0;35m\]'
nc='\[\e[0m\]'

if [ "$UID" = 0 ]; then
    PS1="$red\u$nc@$red\H$nc:$CYAN\w$nc\\n$red#$nc "
else
    #PS1="$PURPLE\u$nc@$CYAN\H$nc:$GREEN\w$nc\\n$GREEN\$$nc "
    PS1="$PURPLE\u$nc@$CYAN\H$nc:$GREEN\w$nc$GREEN\$$nc " # CG: without newline (deleted \\n)
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='exa'
fi

# some more ls aliases
alias mute='pactl set-sink-mute @DEFAULT_SINK@ toggle'
alias tmux='tmux -2' # -2 forces tmux to start up with 256-color support
alias torrent='~/rtorrent/start'
alias cd_shared='cd $CG_SHARED_HOME'
alias screenlock='lockscreen'
alias cls='clear'
alias reboot='sudo shutdown -r now'
alias disable_screensaver='xset s off'
alias enable_screensaver='xset s on'
alias disable_display_power_mgmt='xset -dpms'
alias fm='ranger'
alias tree='tree -aF'
alias df='df -h'                          # human-readable sizes
alias free='free -mh'                      # show sizes in MB
alias vi='nvim'
alias vim='nvim'
alias vdd='nvim -O ~/.bashrc ~/.nvimrc_1 ~/.config/nvim/init.vim ~/.tmux.conf'
alias vd='nvim -o  ~/.bashrc ~/.nvimrc_1 ~/.spectrwm.conf'
alias h='history'
alias his='history'
alias g='grep'
alias v='vim'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias gp='git push'
alias gd='git difftool --tool=meld --no-prompt'
alias gdc='git difftool --tool=meld --cached --no-prompt'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias ga='git add'
alias gua='git reset HEAD --' # removes the given file/dir from the staging area
alias rm='rm -i'
alias mv='mv -i'
alias ll='ls -alh'
alias la='\ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias ms='sudo mount -t cifs -o user=$(teclast_user),password="$(teclast_pwd)",file_mode=0777,dir_mode=0777,rw //TECLAST/cg__shared_folders $CG_SHARED_HOME'
alias ums='sudo umount $CG_SHARED_HOME'
alias ltr='exa -l --sort modified'
alias lt='exa -l -tmodified '
alias font_finder='flatpak run io.github.mmstick.FontFinder'
alias font_ls='fc-list'

type open &>/dev/null || alias open=xdg-open

# Default parameter to send to the "less" command
# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   source /etc/bash_completion
fi
# https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
# Add sbin directories to PATH.  This is useful on systems that have sudo


for l_bindir in /sbin /usr/sbin $HOME/.rbenv/bin $HOME/workspace/bin; do
    echo $PATH | grep -Eq "(^|:)${l_bindir}(:|)" || PATH=$PATH:$l_bindir
done


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



###################### FUNCTIONS #######################################

function dot_files(){
    (cd $HOME && find -maxdepth 1 -type f -name ".*" | egrep "\.[a-zA-Z]" )
}


function git__setup_cg_user() {
    local email="${GMAIL_ADDR}"
    local name="Christian Günther"
    local setup1="git config --global user.name  '${name}'"
    local setup2="git config --global user.email '${email}'"
    echo "Running: $setup1"
    eval $setup1
    echo "Running: $setup2"
    eval $setup2
}



function tempfile(){
    [[ $1 != "-s" || $# != 2 ]]  && echo "tempfile -s <suffix>" && return 1
    mktemp /tmp/XXXXXX-$2
}


function endot() {
    # export df=$(tempfile -s __cg_tmp_file) && (cd && tar zcf $df .config) && gpg -e -r $(git config user.email) $df && gpg -d $df.gpg | tar ztvf - && file $df $df.gpg
    (
    local tf=$(tempfile -s __cg_tmp_file.tgz)
    cd $HOME_DOTCONFIG/..
    tar czf $tf $(basename $HOME_DOTCONFIG)
    gpg -er $GMAIL_ADDR $tf
    rm -f $tf
    )
}


function gpg_encrypt() {
    local dec=$1
    local enc=$2
    # local tf=${dec}.gpg
    local tf=$(tempfile -s __cg_enc)
    rm -f $tf
    [ -z $enc -o -z $dec ]   && echo "Usage: 1) gpg_encrypt <IN_DECRYPTED_FILE> <OUT_ENCRYPTED_FILE>" && return 1
    [ ! -r $dec -o -r $enc -o -r $tf ] && echo "Usage: 2) gpg_encrypt <IN_DECRYPTED_FILE> <OUT_ENCRYPTED_FILE>" && return 1
    gpg --output $tf -er $GMAIL_ADDR $dec && [ -r ${tf} ] && \cp ${tf} $enc && rm -f ${tf} && echo "gpg_encrypt --> $enc" && return 0
    return 1
}


function gpg_decrypt() {
    local enc=$1
    local gpg_options="--decrypt $enc"
    local dec=$2
    [ -z $dec ] || gpg_options="--output $dec $gpg_options"
    [ -z $enc ] && echo "Usage: gpg_decrypt <IN_ENCRYPTED_FILE> <OUT_DECRYPTED_FILE>" && return 1
    [ ! -r $enc ] && echo "Usage: gpg_decrypt <IN_ENCRYPTED_FILE> <OUT_DECRYPTED_FILE>" && return 1
    [ ! -z $dec -a -r $dec ] && echo "Usage: gpg_decrypt <IN_ENCRYPTED_FILE> <OUT_DECRYPTED_FILE>" && return 1
    gpg $gpg_options && return 0
    return 1
}


function teclast_user() {
    local enc=${1:-/home/cg/secret_files/ilan.gpg}
    [ -z $enc -o ! -f $enc ] && echo "Usage: teclast_pwd <IN_ENCRYPTED_FILE>" && return 1
    gpg_decrypt $enc 2>/dev/null | awk '/TECLAST/ {print $2}' && return 0
    return 1
}

function teclast_pwd() {
    local enc=${1:-/home/cg/secret_files/ilan.gpg}
    [ -z $enc -o ! -f $enc ] && echo "Usage: teclast_pwd <IN_ENCRYPTED_FILE>" && return 1
    gpg_decrypt $enc 2>/dev/null | awk '/TECLAST/ {print $3}' && return 0
    return 1
}



function dedot() {
  cd ~/cfg
  gpg -do encrypted.tar.gz encrypted.tar.gz.gpg
  tar xvf encrypted.tar.gz
  rm encrypted.tar.gz
}


function becho() {
  local msg=$@
  echo
  echo "--------------------------------------------------------------------------------"
  [ -z "$msg" ] || echo " $msg "
  echo "--------------------------------------------------------------------------------"
  echo
}


function lockscreen(){
  pgrep xautolock &>/dev/null || xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &
}



# (. ~/.bashrc; MY_NVIM_HOME=/media/cg/USB-DATA/tmp/nvim/home; rm -rf $MY_NVIM_HOME; install_neovim ~/dotfiles $MY_NVIM_HOME && tree $MY_NVIM_HOME)
function install_neovim() {
    # local dry_only=${3:-DRY_ONLY}
    # if [[ ! ${dry_only,,} =~ ^force$ ]]; then   # For case insensitive match use the ${var,,} syntax to conver to lowercase first
    #     nvim_home=${2:-$HOME}
    # fi
    [[ $# < 1 || $# > 2 ]] && echo "install_neovim <DOTFILES_DIR> [<HOME>='/tmp/nvim/home']" >&2 && return 1
    local dotvim_dir=$1
    local nvim_home=${2:-"/tmp/nvim/home"}
    local init_vim_file=""
    for f in vim_plugins.vim .nvimrc_1 init.vim; do
        init_vim_file="${dotvim_dir}/${f}"
        [ ! -r $init_vim_file ] && echo "$init_vim_file not readable" >&2 && return 1
    done
    local bin_dir="$nvim_home/bin"
    local nvim_plugin_dir=$nvim_home/.local/share/nvim/plugged
    local nvim_init=$nvim_home/.config/nvim/init.vim
    local plug_vim=$nvim_home/.local/share/nvim/site/autoload/plug.vim
    local tf=$(tempfile -s _init.nvim)

    mkdir -vp $bin_dir $nvim_plugin_dir $(dirname $nvim_init) $(dirname $plug_vim) && \
        echo "Installing nvim.appimage ..." && \
        cd $bin_dir && \
        curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
        chmod u+x nvim.appimage && \
        ((ln -s ./nvim.appimage nvim && chmod u+x nvim) || echo "Symlink ignored (filesystem seems to not support symlinks).") && \
        becho "NEOVIM successfully installed under $nvim_home/bin/nvim" && \
        echo "Installing vim-plug (plugin manager) ..." && \
        curl -fLo $plug_vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
        becho "vim-plug plugin manager successfully installed under ${plug_vim}." && \
        echo "Initializing $nvim_init ..." && \
        sed -e "s#~/workspace/repos/dotfiles/#${dotvim_dir}/#g" -e "s#~/.local/share/nvim/plugged/#${nvim_plugin_dir}/#g" < $init_vim_file > $tf && \
        ([ -r $nvim_init ] && cp -v $nvim_init ${nvim_init}.bak; echo > /dev/null) && \
        mkdir -p $(dirname $nvim_init) && cp $tf $nvim_init && \
        becho "$nvim_init successfully initialized." && \
        echo && \
        rm -f $tf && \
        return 0

    rm -f $tf
    return 1
}

###################### FUNCTIONS #######################################



[ -f $HOME/bin/.readpwd ]               && source $HOME/bin/.readpwd
[ -f $HOME/.fzf.bash ]                  && source $HOME/.fzf.bash
[ -f $HOME/.bash_aliases ]              && source $HOME/.bash_aliases
[ -f $HOME/dotfiles/resource_stats.sh ] && source $HOME/dotfiles/resource_stats.sh


# Node version manager (NVM) specific stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# source ~/.bash_completion/alacritty
[ -r ~/.config/alacritty/bash_completion/alacritty ] && source ~/.config/alacritty/bash_completion/alacritty


# Only initialize rbenv if it hasn't been initialized yet (otherwise $PATH will get flooded with $HOME/.rbenv/shims in each bash subshell)
# rbenv specific settings
type rbenv &>/dev/null && for l_bindir in $HOME/.rbenv/shims; do
    echo $PATH | grep -Eq "(^|:)${l_bindir}(:|)" || eval "$(rbenv init -)"
done
# eval "$(rbenv init -)"

# echo ".bashrc was running"

# LAST LINE
# vim: set ts=4 sw=4 tw=0 et :
