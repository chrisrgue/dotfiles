" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('/home/cg/.local/share/nvim/plugged')

" ################################################################################
                                                                            " General plgins
                                                                            "---------------
Plug 'mhinz/vim-startify'                                                   " A nice startup page with possibilities to get your previous buffers up and running at the tip of your fingers
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'                                            " Plug  'joequery/Stupid-EasyMotion'
Plug 'dense-analysis/ale'                                                   " Ale is a very powerful linter and fixer that works with many programming languages, a real must have (especially because it work almost out of the box) link!
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'                                       " For completion for python
Plug 'uplus/deoplete-solargraph'                                            " For completion for ruby
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'                                                 " Commenting
Plug 'tomtom/tcomment_vim'                                                  " Commenting
" Plug 'scrooloose/nerdcommenter'                                           " Commenting
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-zoom'
Plug 'https://gitlab.com/tsingyixy/vim-bookmarks'
" Plug 'jiangmiao/auto-pairs'                                                 " autocomplete parenthesis and other brackets link

Plug  'vim-scripts/AutoComplPop'                                            " Automatically show VIM's complete menu while typing
                                                                            " Ruby/Rails development specific plugins
Plug 'vim-ruby/vim-ruby'

                                                                            " See https://github.com/autozimu/LanguageClient-neovim
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh' }

" https://github.com/autozimu/LanguageClient-neovim

Plug 'https://github.com/tpope/vim-rails', { 'for': 'ruby' }
Plug 'mattn/emmet-vim'                                                      " emmet expansion see https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL

                                                                            " Colorschemes
Plug 'kamwitsta/nordisk'
Plug 'sickill/vim-monokai'
Plug 'altercation/solarized'
Plug 'croaker/mustang-vim'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'                                                     " or other package manager
" Plug  'altercation/vim-colors-solarized'

                                                                             " GIT plugins
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'                                                       " :GV to open git commit browser (requires fugitive); https://github.com/junegunn/gv.vim

Plug 'airblade/vim-gitgutter'                                                " Display your changes in a gutter, undo them and preview them
                                                                             " ############ CG ##################

                                                                             " ######### From DT ###############
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}                           " Markdown preview
Plug 'frazrepo/vim-rainbow'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'                                                      " Color previews for CSS
Plug 'junegunn/vim-emoji'                                                    " Vim need emojis
Plug 'jreybert/vimagit'                                                      " Magit like plugin for vim


                                                                             " ######### From DT ###############

                                                                             " ######### From ThePrimeagen (Vim Life Ep: Coc vs YCM) #########
                                                                             " Plug 'ycm-core/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'                                                       " Needs python support
" Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
                                                                             " ######### From ThePrimeagen #########

                                                                             " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

                                                                             " Any valid git URL is allowed
Plug 'junegunn/vim-github-dashboard'

                                                                             " Multiple Plug commands can be written in a single line using | separators
                                                                             " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

                                                                             " On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }
                                                                             " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

                                                                             " Using a non-master branch
                                                                             " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

                                                                             " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
                                                                             " Plug 'fatih/vim-go', { 'tag': '*' }

                                                                             " Plugin options
                                                                             " Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

                                                                             " Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }            "  Multi-entry selection UI.

" Unmanaged plugin (manually installed and updated)
""Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


