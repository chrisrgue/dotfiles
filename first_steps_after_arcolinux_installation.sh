#!/usr/bin/env bash

################################################################################
function update() {
    sudo pacman -Syyu $@
}

function run() {
    [ $# -lt 2 ] && echo "Number of args: $#" >&2 && echo "$@" >&2 && echo "run <title> <cmd> <arg>*" >&2 && return 1
    local title=$1
    shift
    echo
    echo "$title {"
    eval "$@"
    echo "$title }"
}
################################################################################

[ ! -r ~/.local/share/fonts/Mononoki_Nerd_Font.ttf ] && \
    run "Installing fonts" \
        "cd ~/.local/share/fonts && \
         curl -fLo 'Mononoki_Nerd_Font.ttf' \
         https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf
        "


[ ! -r ~/Pictures/wallpapers ] && \
    run "Installing wallpapers" \
        "cd ~/Pictures && git clone https://gitlab.com/dwt1/wallpapers ~/Pictures/wallpapers"


type w3m &>/dev/null ||
    run "Installing packages" \
        "update qtile exa firefox xclip xsel pass python-pip fzf postgresql postgresql-libs vifm ranger w3m"


[ ! -r ~/.config/ranger/plugins/ranger_devicons ] && \
    run "Installing ranger devicons (but skipping ueberzug)" \
        "
          git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
          # yay -S python-ueberzug-git
        "


f=~/.config/ranger/rc.conf
if [ ! -r $f ]; then
    run "Installing ranger config files" \
        "ranger --copy-config=all"

    run "Setting up ranger's rc.conf" \
        "cat << 'EOF' >> $f
# set preview_images_method ueberzug
default_linemode devicons
set show_hidden true
EOF
        "
fi


[ ! -r ~/dotfiles ] &&
    run "Cloning into ~/dotfiles" \
        "git clone https://github.com/chrisrgue/dotfiles.git ~/dotfiles && \
         cd ~/dotfiles && \
         git remote set-url origin git+ssh://git@github.com/chrisrgue/dotfiles
        "


[ ! -r /usr/share/X11/xkb/symbols/se.orig ] && \
    run "Fixing swedish keyboard map" \
        "sudo cp -v /usr/share/X11/xkb/symbols/se /usr/share/X11/xkb/symbols/se.orig && \
         sudo cp -v ~/dotfiles/se.modified_keyboard_mapping /usr/share/X11/xkb/symbols/se
        "


[ ! -r ~/.bashrc-personal ] && \
    run "Setting up ~/.bashrc-personal" \
        "echo '[[ -r ~/dotfiles/.bashrc ]] && . ~/dotfiles/.bashrc' >> ~/.bashrc-personal"


! grep -- "[[ -f ~/dotfiles/.bash_profile ]]" ~/.bash_profile &>/dev/null &&
    [ "$(readlink -ef ~/.bash_profile)" != "$HOME/dotfiles/.bash_profile" ] &&
    run "Setting up ~/.bash_profile" \
        "echo '[[ -f ~/dotfiles/.bash_profile ]] && . ~/dotfiles/.bash_profile' >> ~/.bash_profile"


for f in .tmux.conf .gitconfig;do
    [ ! -r ~/$f -a -r ~/dotfiles/$f ] && \
        run "Setting up ~/$f" \
            "cd ~ && ln -vs ~/dotfiles/$f"
done


! pip3 show neovim &>/dev/null &&
    run "Installing neovim python modules (required by deoplete VIM-plugin)" \
        "sudo pip3 install neovim"


[ ! -r ~/.password-store ] &&
    run "Cloning https://github.com/chrisrgue/pass-store into ~/.password-store" \
        "git clone https://github.com/chrisrgue/pass-store ~/.password-store/ && \
         pass git remote set-url origin git+ssh://git@github.com/chrisrgue/pass-store
        "


[ ! -x ~/bin/gitflow-installer.sh ] &&
    run "Installing gitflow-installer.sh" \
        "mkdir -p ~/bin && cd ~/bin && \
         wget -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && \
         chmod +x ~/bin/gitflow-installer.sh
        "


! git-flow version &>/dev/null &&
    run "Installing git-flow" \
        "sudo bash ~/bin/gitflow-installer.sh install stable"


cat << EOF

    ################################################################################
    For next steps check the following functions inside ~/dotfiles/.bashrc:

        mkdir -p ~/Pictures/screenshots  # for screenshot.sh
        install_neovim ~/dotfiles \$HOME
        install_rbenv; . ~/.bashrc; rbenv install 2.7.1
        . ~/.bashrc
        rbenv global 2.7.1
        . ~/.bashrc
        ruby --version
        gem install tmuxinator solargraph rails pg postgresql
        howto_install_gems_for_depolete_completion
        howto_add_public_ssh_key_for_login_less_github_access
    ################################################################################


    ################################################################################
    Check the following URLS:
        https://github.com/malnvenshorn/OctoPrint-FilamentManager/wiki/Setup-PostgreSQL-on-Arch-Linux
        http://eradman.com/entrproject/
        http://rogerdudler.github.io/git-guide/index.de.html
        https://www.youtube.com/watch?v=XbapC7nm49s
        http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
        https://www.muenchen.de/rathaus/Stadtverwaltung/Kreisverwaltungsreferat/Verkehr/Parkraummanagement/Parkausweis-fuer-Anwohner.html
    ################################################################################

 $0 DONE

EOF

exit 0

