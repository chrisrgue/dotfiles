" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('/home/cg/.local/share/nvim/plugged')

" make sure you use single quotes
"############ CG ##################
"     General plgins
Plug  'easymotion/vim-easymotion'   " Plug  'joequery/Stupid-EasyMotion'
Plug  'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug  'tpope/vim-surround'
Plug  'tpope/vim-commentary'
Plug  'tpope/vim-repeat'
Plug  'kana/vim-textobj-user'
Plug  'nelstrom/vim-textobj-rubyblock'
Plug  'godlygeek/tabular'
Plug  'dhruvasagar/vim-zoom'
Plug  'https://gitlab.com/tsingyixy/vim-bookmarks'
Plug  'https://github.com/tomtom/tcomment_vim' " Commenting
Plug  'vim-scripts/AutoComplPop' " Automatically show VIM's complete menu while typing
"     Rails development specific plugins
Plug  'https://github.com/tpope/vim-rails', { 'for': 'ruby' }
Plug  'mattn/emmet-vim' "emmet expansion see https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
Plug  'vim-airline/vim-airline'
"Colorschemes
Plug  'kamwitsta/nordisk'
Plug  'sickill/vim-monokai'
Plug  'altercation/solarized'
Plug  'altercation/solarized'
Plug  'croaker/mustang-vim'
Plug  'dracula/vim'
Plug  'morhetz/gruvbox'
"Plug  'altercation/vim-colors-solarized'
"Plug  'morhetz/gruvbox'
" GIT plugins
Plug  'tpope/vim-fugitive'
Plug  'airblade/vim-gitgutter'
"############ CG ##################

" ######### From DT ###############
Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown preview
Plug 'frazrepo/vim-rainbow'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'  " Color previews for CSS
Plug 'junegunn/vim-emoji' " Vim need emojis
Plug 'jreybert/vimagit'   " Magit like plugin for vim
" ######### From DT ###############

" ######### From ThePrimeagen (Vim Life Ep: Coc vs YCM) #########
" Plug 'ycm-core/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags' "Needs python support
" Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
" ######### From ThePrimeagen #########

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
""Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


