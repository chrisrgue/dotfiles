#!/usr/bin/env bash

# Add new packages at end of list !!!
req_arch_pacs="qtile exa firefox xclip xsel pass python-pip fzf \
                postgresql postgresql-libs vifm ranger w3m cronie \
                pandoc ripgrep the_silver_searcher fd skim highlight bat yarn phpmyadmin \
              "


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

[ "$DOTFILES_HOME" == "" -o ! -r $DOTFILES_HOME ] && \
    echo "Sorry: $DOTFILES_HOME must exist" && \
    echo "Maybe: export 'DOTFILES_HOME=~/dotfiles'" >&2 && exit 1


[ "$REPOS_HOME" != "" -a ! -r $REPOS_HOME ] && \
    run "Creating repository home: $REPOS_HOME" \
        "mkdir -p $REPOS_HOME"


[ ! -r $REPOS_HOME/devour ] && \
    run "Installing $REPOS_HOME/devour" \
        "git clone https://github.com/salman-abedin/devour.git $REPOS_HOME/devour && cd $REPOS_HOME/devour && sudo make install"


[ ! -r $REPOS_HOME/entr ] && \
    run "Installing https://github.com/eradman/entr" \
        "git clone https://github.com/eradman/entr $REPOS_HOME/entr && cd $REPOS_HOME/entr && ./configure && make test && sudo make install"


[ ! -r ~/.local/share/fonts/Mononoki_Nerd_Font.ttf ] && \
    run "Installing fonts" \
        "mkdir -p ~/.local/share/fonts && \
         cd ~/.local/share/fonts && \
         curl -fLo 'Mononoki_Nerd_Font.ttf' \
         https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete.ttf
        "


[ ! -r ~/Pictures/wallpapers ] && \
    run "Installing wallpapers" \
        "git clone https://gitlab.com/dwt1/wallpapers ~/Pictures/wallpapers"


[ ! -r ~/.tmux-themepack ] && \
    run "Installing tmux-themepack" \
        "git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack"


! command -V $(echo "$req_arch_pacs" |awk '{print $NF}') &>/dev/null &&
    run "Installing packages" \
    "update $req_arch_pacs && \
    ! command -V sk &>/dev/null && yay -S aur/universal-ctags-git \
    "
         #update texlive-most \


# command -V pandoc-crossref &>/dev/null ||
#     run "Installing pandoc-crossref from AUR" \
#         "yay -S pandoc-crossref"


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


[ ! -r $DOTFILES_HOME ] &&
    run "Cloning into $DOTFILES_HOME" \
        "git clone https://github.com/chrisrgue/dotfiles.git $DOTFILES_HOME && \
         cd $DOTFILES_HOME && \
         git remote set-url origin git+ssh://git@github.com/chrisrgue/dotfiles
        "


! cmp -s $DOTFILES_HOME/se.modified_keyboard_mapping /usr/share/X11/xkb/symbols/se && \
    run "Fixing swedish keyboard map" \
    "sudo cp -v /usr/share/X11/xkb/symbols/se /usr/share/X11/xkb/symbols/se.orig__$(date +'%F') && \
         sudo cp -v $DOTFILES_HOME/se.modified_keyboard_mapping /usr/share/X11/xkb/symbols/se
        "



[ ! -r ~/.bashrc-personal ] && \
    run "Setting up ~/.bashrc-personal" \
        "echo '[[ -r $DOTFILES_HOME/.bashrc ]] && . $DOTFILES_HOME/.bashrc' >> ~/.bashrc-personal"


! grep -- "[[ -f $DOTFILES_HOME/.bash_profile ]]" ~/.bash_profile &>/dev/null &&
    [ "$(readlink -ef ~/.bash_profile)" != "$HOME/dotfiles/.bash_profile" ] &&
    run "Setting up ~/.bash_profile" \
        "echo '[[ -f $DOTFILES_HOME/.bash_profile ]] && . $DOTFILES_HOME/.bash_profile' >> ~/.bash_profile"


for f in .tmux.conf .gitconfig .inputrc;do
    [ ! -r ~/$f -a -r $DOTFILES_HOME/$f ] && \
        run "Setting up ~/$f" \
            "cd ~ && ln -vs $DOTFILES_HOME/$f"
done


[ ! -r $RAILS_APPS_HOME/tutorial_apps/CS50_Rails_Seminar ] &&
    run "Cloning into $RAILS_APPS_HOME/tutorial_apps/CS50_Rails_Seminar" \
        "git clone https://github.com/lhofer/CS50_Rails_Seminar.git $RAILS_APPS_HOME/tutorial_apps/CS50_Rails_Seminar"


! pip3 show neovim &>/dev/null &&
    run "Installing neovim python modules (required by deoplete VIM-plugin)" \
        "sudo python3 -m pip install neovim pynvim; \
         sudo python3 -m pip install --user tmuxp; \
         sudo python3 -m pip install ueberzug; \
         sudo python2 -m ensurepip --default-pip && \
         sudo python2 -m pip install --upgrade pip && \
         sudo python2 -m pip install neovim pynvim && \
         sudo python2 -m pip install --user tmuxp
        "


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


cat <<-'EOF'

	################################################################################
    For next steps check the following (see $DOTFILES_HOME/.bashrc):

	    install_neovim $DOTFILES_HOME $HOME
	    install_rbenv; . ~/.bashrc; rbenv install 2.7.1
	    . ~/.bashrc
	    rbenv global 2.7.1
	    . ~/.bashrc
	    ruby --version
	    gem install tmuxinator solargraph rails pg postgresql neovim pry rspec testrb guard minitest
	    sudo npm install -g neovim
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

