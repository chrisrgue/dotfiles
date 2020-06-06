# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

################################################################################
# Start tmux on every shell login
# Make sure that:
#  (1) tmux exists on the system,
#  (2) we're in an interactive shell, and
#  (3) tmux doesn't try to run within itself:
#
# [[ $TMUX = "" ]] && export TERM="xterm-256color"
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -2
fi
#
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

export EDITOR=nvim
export VISUAL=nvim
export CG_SHARED_HOME=$HOME/cg__shared_folders
export HOME_DOTCONFIG=$HOME/.config
export GMAIL_ADDR="christianr.guenther@gmail.com"
export REPOS_HOME=$HOME/tmp/workspace/repos
export RANGER_LOAD_DEFAULT_RC=false # To stop ranger from loading both the default and your custom rc.conf,
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # GCC output

# Language settings
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

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

# ALL_COLORS="red blue cyan green yellow purple"
# for c in $ALL_COLORS;do
#     f1="function echo_${c}()"
#     args='$@'; t='$';
#     eval "color=\"${t}${c}\"";
#     body=" { echo \"${color}${args}${nc}\"; }"
#     f="${f1}${body}"
#     eval $f
# done

path_color=$YELLOW
user_color=$green
host_color=$cyan
[ "$UID" = 0 ] && user_color=$red && host_color=$red

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
    PS1="${debian_chroot:+($debian_chroot)}$user_color\u$nc@$host_color\H$nc:$path_color\w$nc (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\H:\w (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "
fi
unset color_prompt force_color_prompt

alias take1='pick1'
alias one_from='pick1'
alias ripgrep='rg'
alias aart='figlet'
alias ascii_art=aart
alias vimfm=vifm
alias vfm=vifm
alias rm_passphrase_for_key=disable_passphrase_for_key
alias pacs='pacman -Ss'
alias pac_search='pacs'
alias search='pacs'
alias e='env'
alias r='ruby'
alias cdd='cd ~/dotfiles'
alias use_vim_as_pager='set_vim_as_pager on'
alias unset_vim_as_pager='set_vim_as_pager off'
alias unuse_vim_as_pager='set_vim_as_pager off'
alias gl='git log --abbrev-commit --abbrev=10 -n 10'
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
alias free='free -mh'                     # show sizes in MB
alias vi='nvim'
alias vim='nvim'
alias vdd='nvim -O ~/.bashrc ~/.nvimrc_1 ~/.config/nvim/init.vim ~/.tmux.conf'
alias vd='nvim -o  ~/.bashrc ~/.nvimrc_1 ~/.spectrwm.conf'
alias his='history'
alias h='history'
alias v='vim'
alias rc='random_colorscheme'
alias rv='VIM_COLORSCHEME=$(rc) v'
alias g='grep'
alias eg='egrep'
alias fg='fgrep'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias gp='git push'
alias gpl='git pull'
alias gP='git pull'
alias rgd='VIM_COLORSCHEME=$(rc) git difftool'           # --tool=meld --no-prompt'
alias gd='git difftool'                                  # --tool=meld --no-prompt'
alias rgdc='VIM_COLORSCHEME=$(rc) git difftool --cached' # --tool=meld --no-prompt'
alias gdc='git difftool --cached'                        # --tool=meld --no-prompt'
alias gs='git status'
alias gsd='cdd && gs'
alias gc='git commit'
alias gm='git merge'
alias gmt='git mergetool'
alias gcm='git commit -m'
alias gacm='git commit -a -m'
alias ga='git add'
alias gall='git add .'
alias gb='git branch'
alias gco='git checkout'
alias gch='gco'
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='exa'
fi

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


for l_bindir in /sbin /usr/sbin $HOME/.rbenv/bin $HOME/workspace/bin $HOME/.gem/ruby/2.7.0/bin; do
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

# setup_keyboard      # don't remap CAPS_LOCK
# setup_keyboard on   # --> also maps CAPS_LOCK to ESCAPE
function setup_keyboard() {
    local val=${1:-""}

    # Increase key speed via a rate change
    xset r rate 300 50 && \
        echo "Increased KEY rate."

    if is_yes $val; then
        cat <<-EOF
			Remapping CAPS_LOCK to SUPER
			but
			if pressed STANDALONE then map it to ESCAPE.
		EOF

        # Map the caps lock key to super
        setxkbmap -option caps:super -variant altgr-intl && \
        # setxkbmap -option caps:swpapescape

        # But when it is presed only once, treat it as escape.
        killall xcape 2>/dev/null
        xcape -e 'Super_L=Escape'
    fi

    # Map the menu button to right super as well.
    xmodmap -e 'keycode 135 = Super_R'
}

function pick1() {
    local choices=${@:-$INVALID}
    local picks=${choices:-"1 2 3 4 5 6 7 8 9 0"}
    local ary=($picks)   # Read into array variable.
    local num=${#ary[*]} # Count how many elements.
    echo "${ary[$((RANDOM%num))]}"
}

# function random_colorscheme() {
#     local preferred_vim_colorschemes=${1:=$PREFERRED_VIM_COLORSCHEMES}
#     local colorschemes=${preferred_vim_colorschemes:-"      \
#         dayu darkblue delek elflord gruvbox jellybeans      \
#         morning mustang peachpuff shine spacegray zellner   \
#         blue default desert evening industry koehler murphy \
#         pablo ron slate torte"}
#
#     local ary_colorschemes=($colorschemes)         # Read into array variable.
#     local num_colorschemes=${#ary_colorschemes[*]} # Count how many elements.
#
#     echo "${ary_colorschemes[$((RANDOM%num_colorschemes))]}"
# }
function random_colorscheme() {
    pick1 ${@:-$PREFERRED_VIM_COLORSCHEMES}
}

# Examples:
#        is_yes yes  -> 0
#        is_yes true -> 0
#        is_yes on   -> 0
#        is_yes 1    -> 0
#        is_yes      -> 1
#        is_yes off  -> 1
#        is_yes 0    -> 1
#        is_yes no   -> 1
#
#        See also usage in set_vim_as_pager()
function is_yes() {
    local val=${1:-""}
    [[ ${val,,} =~ ^(yes|on|true|1|enabled?)$ ]] && return 0  # For case insensitive match use the ${var,,} syntax to conver to lowercase first
    return 1
}


# setup vim as default pager (for apps like "man pages" or "git log")
#
# Examples: set_vim_as_pager 1  # or true enable yes
#           set_vim_as_pager   (same as set_vim_as_pager 1)
#           set_vim_as_pager 0
#           set_vim_as_pager no
function set_vim_as_pager() {
    # Note:
    # The git log command pipes it's output by default into a pager,
    # not an editor. This pager is usually less or more on most systems.
	# You can change the default pager to vim with the command:
    #          git config --global core.pager 'vim -'
    local val=${1:-true}
    if is_yes $val; then
        export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
            vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
            -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
            -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
    else
        unset PAGER
    fi
}



# setup nvim as default pager (for apps like "man pages" or "git log")
#
# Examples: set_nvim_as_pager 1  # or true enable yes
#           set_nvim_as_pager   (same as set_nvim_as_pager 1)
#           set_nvim_as_pager 0
#           set_nvim_as_pager no
function set_nvim_as_pager() {
    # Note:
    # The git log command pipes it's output by default into a pager,
    # not an editor. This pager is usually less or more on most systems.
	# You can change the default pager to vim with the command:
    #          git config --global core.pager 'vim -'
    local val=${1:-true}
    if is_yes $val; then
        export MANPAGER='nvim +Man!'
    else
        unset MANPAGER
    fi
}



function ls_home_dot_files() {
    (cd $HOME && find -maxdepth 1 -type f -name ".*" | egrep "\.[a-zA-Z]" |xargs echo)
}



function howto_add_public_ssh_key_for_login_less_github_access() {
    cat <<-'EOF'

STEP-1: Generate new ssh key pair
---------------------------------

$ ssh-keygen -t rsa -b 4096 -C "${GMAIL_ADDR}"
..
$



STEP-2: Add generated private key to the ssh-agent
-------------------------------------------------

STEP-2-1: First start ssg-agent (if it isn't running yet [check with 'pgrep ssh-agent'])
----------------------------------------------------------------------------------------

$ eval `ssh-agent -s`
Agent pid 20634
$

STEP-2-2: First start ssg-agent (if it isn't running yet)
--------------------------------------------------------

$ ssh-add ~/.ssh/id_rsa
 ...
$



STEP-3: Copy generated public key into clipboard
-------------------------------------------------

STEP-3-1: First install xclip (if it isn't installed yet)
---------------------------------------------------------

~$ pacman -S xclip
...
~$

STEP-3-2: Copy generated public key into clipboard
---------------------------------------------------------

~$ xclip -sel clip < ~/.ssh/id_rsa.pub
~$

STEP-4: Add the public ssh-key (current clipboard content)
        to github account

        Click on github profile icon
  		  -> Settings
  		  -> Personal setting (on the  left side)
  		  -> SSH and GPG keys
  		  -> Click on "New SSH key" button
  		  -> Paste the public key clipboard content

EOF
}


function howto_change_keymaps() {
    cat <<-EOF

For a list of all the available keymaps, use the command:

$ localectl list-keymaps

To search for a keymap, use the following command, replacing search_term with the code for your language, country, or layout:

$ localectl list-keymaps | grep -i search_term

Alternatively, using find:

$ find /usr/share/kbd/keymaps/ -type f

Loadkeys

It is possible to set a keymap just for current session. This is useful for testing different keymaps, solving problems etc.

The loadkeys tool is used for this purpose, it is used internally by systemd when loading the keymap configured in /etc/vconsole.conf. It can be used very simply for this purpose:

# loadkeys keymap

See loadkeys(1) details.
Persistent configuration

A persistent keymap can be set in /etc/vconsole.conf, which is read by systemd on start-up. The KEYMAP variable is used for specifying the keymap. If the variable is empty or not set, the us keymap is used as default value. See vconsole.conf(5) for all options. For example:

/etc/vconsole.conf

KEYMAP=uk
...

For convenience, localectl may be used to set console keymap. It will change the KEYMAP variable in /etc/vconsole.conf and also set the keymap for current session:

$ localectl set-keymap --no-convert keymap

EOF
}


function howto_install_gems_for_depolete_completion() {
    cat <<-EOF

    # See
    #     - https://blog.schembri.me/post/solargraph-in-vim/
    #     - https://github.com/halftan/dotfiles/blob/master/.vimrc#L469-L521

    gem install solargraph  # Install solargrpah LanguageServer
    gem install yard        # Install yard documentation generator

	yard gems               # Generate docu for installed gems

    # To save us running 'yard gems' regularly, we can also ensure that
    # any newly-installed gems automatically generate YARD documentation:

    yard config --gem-install-yri  # ==> generates 'gem' entry in ~/.gemrc:     gem: "--user-install --document=yri"

EOF
}


function rbenv_related_aur_packages() {
cat <<-EOF
	rbenv
	ruby-build
EOF
}




function install_fonts() {
    local font_list="Inconsolata SauceCodePro CodeNewRoman RobotoMono Hack JetBrainsMono UbuntuMono Monofur Terminess Mononoki"
    #                                                        nice           nice           nice                ok       nice
}




function install_entr() {
    local keep=${1}
    local entr_file=${2:-http://eradman.com/entrproject/code/entr-4.5.tar.gz}
    local bentr_file=$(basename $entr_file)
    local ndir=${bentr_file%.tar.gz} #entr-4.5
    local dl_file=/tmp/entr_dl.tgz
    local td=$(dirname $dl_file)
    (
        mkdir -p $td && \
        cd $td && \
        rm -f $dl_file && \
        curl ${entr_file} -o $dl_file && \
        tar zxf $dl_file && \
        cd $ndir && \
        ./configure && \
        make test && \
        sudo make install && \
        cd .. && \
        echo "Successfully installed $ndir" && \
        ! is_yes $keep && \
        rm -rf "$td/$ndir" $dl_file
    )
}


function howto_install_python_packages() {
    cat << 'EOF'
    pip3 install pyls # python LanguageServer
EOF
}


# If you don't want to have ever enter a passphrase you can simply remove it from your key.
#
# On the command line:
function disable_passphrase_for_gpg_key() {
    local key_or_email=${1:-$GMAIL_ADDR}
    gpg --passwd $key_or_email
}


function howto_disable_passphrase_for_ssh_key() {
    cat << 'EOF'

    See https://unix.stackexchange.com/questions/12195/how-to-avoid-being-asked-passphrase-each-time-i-push-to-bitbucket

    Create (or edit if it exists) the following ~/.ssh/config file:

    Host *
        UseKeychain yes
        AddKeysToAgent yes
        IdentityFile ~/.ssh/id_rsa

    share improve this answer
    answered Mar 26 '18 at 10:40
    ness-EE
    30122 silver badges44 bronze badges

        But I'm using a different pair of keys for every service... – connexo Jun 16 '18 at 16:53
        @connexo you can replace the wildcard asterisk with your individual host name a< nd 'id_rsa' with your corresponding private key – ness-EE Jun 25 '18 at 13:26
        2
        I needed to add IgnoreUnknown AddKeysToAgent,UseKeychain just above UseKeychain yes. – consideRatio Jul 22 '18 at 23:36

    2
    I'm getting this error: "Bad configuration option: usekeychain" on the "UseKeychain yes" line. – m4l490n Oct 31 '18 at 15:09
    1
    it works in addition of the option in consideRatio's comment. @m4l490n you can try as well with that option, I had the same error message without the option. – рüффп Mar 24 at 10:23

EOF
}

function install_aur_package() {
	[[ $# != 1 ]] && echo "install_package <AUR_PKGNAME>" >&2 && return 1
	local pkg=$1
	mkdir -p $REPOS_HOME && \
		cd $REPOS_HOME && \
		git clone https://aur.archlinux.org/${pkg}.git && \
		cd $pkg && \
		makepkg -si && \
		return 0
	return 1
}


# echo
# echo "See https://wiki.archlinux.org/index.php/Rbenv"
# echo
function install_rbenv() {
	for pkg in $(rbenv_related_aur_packages);do
 		install_aur_package $pkg
	done
	# pacman -S --needed base-devel libffi libyaml openssl zlib
}


function git__setup_cg_user() {
    local forced=$1
    if ! is_yes "$forced"; then
        git config --global user.email | grep -l christianr &>/dev/null && echo "CG seems to be setup fine already." && return 0
    fi
    local email="${GMAIL_ADDR}"
    local name="Christian Günther"
    local setup1="git config --global user.name  '${name}'"
    local setup2="git config --global user.email '${email}'"
    local setup_colored_console_output="git config --global color.ui true"
    local setup_pretty_log_oneline_format="git config --global format.pretty oneline" # Eine Zeile pro Commit in der Logausgabe:
    echo "Running: $setup1"
    eval $setup1
    echo "Running: $setup2"
    eval $setup2
    echo "Running: $setup_colored_console_output"
    eval $setup_colored_console_output
    echo "Running: $setup_pretty_log_oneline_format"
    eval $setup_pretty_log_oneline_format
}



function tempfile() {
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
    pass home/lan/teclast/uid && return 0
    return 1
}

function teclast_pwd() {
    pass home/lan/teclast/pwd && return 0
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


function lockscreen() {
  pgrep xautolock &>/dev/null || xautolock -time 1 -locker slock -cornersize 40 -cornerdelay 2 -cornerredelay 10 -corners '++++' &
}

# Example: integrate_dotfile_at_home ~/dotfiles/.bashrc ~"
function integrate_dotfile_at_home() {
    local dhome=$(readlink -ef ${2:-"/tmp/my_home"})
    mkdir -p $dhome
    [[ $# < 1 || $# > 2 || ! -r $1 || ! -w $dhome || ! -d $dhome ]] && echo "integrate_dotfile_at_home <dotfile> [<home>=$dhome]" && return 1
    local abs_dot_file=$(readlink -ef $1)
    local dot_file=$(basename $abs_dot_file)
    local dfile=$(readlink -ef "$dhome/$dot_file")
    local prefix="### CG: Integrating $abs_dot_file "
    local emsg="integrate_dotfile_at_home $abs_dot_file $dhome FAILED !!!"
    # if dot_file exists with identical name in $HOME then add to source the dot_file in that exisiting $dfile
    # otherwise add symbolic link in $HOME to the dotfiles
    if [[ $abs_dot_file != $dfile ]]; then
        if [[ -w $dfile ]]; then
            grep -sq "$prefix" $dfile && becho "Integration of '${abs_dot_file}' into existing '${dfile}' already exists !!!" && return 1
            cat << EOF >> $dfile

$prefix {
[ -f ${abs_dot_file} ] && . ${abs_dot_file}
$prefix }

EOF
            grep -sq "$prefix" $dfile && becho "Added integration of '${abs_dot_file}' into existing '${dfile}'." && return 0
        else
            ln -s $abs_dot_file $dfile
            [ -r $dfile ] && becho "Added symlink: ${dfile} -> $abs_dot_file" && return 0
        fi
    else
        emsg="Source file '$abs_dot_file' and '$dfile' are identical !!!"
    fi

    echo "$emsg" >&2
    return 1
}


# (. ~/.bashrc; MY_NVIM_HOME=/media/cg/USB-DATA/tmp/nvim/home; rm -rf $MY_NVIM_HOME; install_neovim ~/dotfiles $MY_NVIM_HOME && tree $MY_NVIM_HOME)
function install_neovim() {
    # local dry_only=${3:-DRY_ONLY}
    # if [[ ! ${dry_only,,} =~ ^force$ ]]; then   # For case insensitive match use the ${var,,} syntax to conver to lowercase first
    #     nvim_home=${2:-$HOME}
    # fi
    [[ $# < 1 || $# > 2 ]] && echo "install_neovim <DOTFILES_DIR> [<HOME>='/tmp/nvim/home']" >&2 && return 1
    local dotfiles_dir=$(readlink -ef $1)
    local nvim_home=$(readlink -ef ${2:-"/tmp/nvim/home"})
    local init_vim_file=""
    for f in vim_plugins.vim .nvimrc_1 init.vim; do
        init_vim_file="${dotfiles_dir}/${f}"
        [ ! -r $init_vim_file ] && echo "$init_vim_file not readable" >&2 && return 1
    done
    local bin_dir="$nvim_home/bin"
    local shada_file="$nvim_home/.config/nvim/files/info/viminfo"
    local nvim_plugin_dir=$nvim_home/.local/share/nvim/plugged
    local nvim_init=$nvim_home/.config/nvim/init.vim
    local viminfo_dir=$nvim_home/.config/nvim/files/info   # necessary for startify plugin (see in vim  :help startify-faq-02)
    local plug_vim=$nvim_home/.local/share/nvim/site/autoload/plug.vim
    local tf=$(tempfile -s _init.nvim)

    mkdir -vp $viminfo_dir $bin_dir $nvim_plugin_dir $(dirname $nvim_init) $(dirname $plug_vim) $(dirname $shada_file) && \
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
        sed -e "s#~/workspace/repos/dotfiles/#${dotfiles_dir}/#g" -e "s#~/.local/share/nvim/plugged/#${nvim_plugin_dir}/#g" < $init_vim_file > $tf && \
        ([ -r $nvim_init ] && cp -v $nvim_init ${nvim_init}.bak; echo > /dev/null) && \
        mkdir -p $(dirname $nvim_init) && cp $tf $nvim_init && \
        becho "$nvim_init successfully initialized." && \
        echo && \
        rm -f $tf && \
        return 0

    # touch $shada_file
    rm -f $tf
    return 1
}


# Codi
# Usage: codi [filetype] [filename]
function codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}


###################### FUNCTIONS #######################################

# Setup preferred Vim-colorscheme
test -z $PREFERRED_VIM_COLORSCHEMES && export PREFERRED_VIM_COLORSCHEMES="mustang gruvbox jellybeans industry"
# export VIM_COLORSCHEME=$(random_colorscheme)


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

set_nvim_as_pager

# LAST LINE
# vim: set ts=4 sw=4 tw=0 et :
