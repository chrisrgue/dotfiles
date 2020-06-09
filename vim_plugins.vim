"        _                       _             _
" __   _(_)_ __ ___        _ __ | |_   _  __ _(_)_ __  ___
" \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` | | '_ \/ __|
"  \ V /| | | | | | |_____| |_) | | |_| | (_| | | | | \__ \
"   \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |_|_| |_|___/
"                         |_|            |___/
"


" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('/home/cg/.local/share/nvim/plugged')

" ######################### OPTIONAL PLUGINS #################################### {
"""CG: Plug 'junegunn/vim-github-dashboard'                                         " Browse GitHub events (user dashboard, user/repo activity) in Vim.
"""CG: Plug 'junegunn/vim-easy-align'
"""CG: Plug 'lyuts/vim-rtags'                                                       " RTags is a client/server application that indexes C/C++ code and keeps a persistent file-based database of references, declarations, definitions, symbolnames etc. There’s also limited support for ObjC/ObjC++.
"""CG: Plug 'vim-utils/vim-man'                                              " Open man pages in vim (splits)
"""CG: Plug 'vimwiki/vimwiki'
"""CG: Plug 'easymotion/vim-easymotion'                                            " Plug  'joequery/Stupid-EasyMotion'
"""CG: Plug 'junegunn/limelight.vim'
"""CG: Plug 'junegunn/goyo.vim'
"""" COLORSCHEMES
"""CG: Plug 'romainl/Apprentice'
"""CG: Plug 'jacoborus/tender.vim'
"""CG: Plug 'NLKNguyen/papercolor-theme'
"""CG: Plug 'kristijanhusak/vim-hybrid-material'
"""CG: Plug 'dracula/vim'
"""CG: Plug 'altercation/solarized'
"""CG: Plug 'sickill/vim-monokai'

"""CG: Plug 'kamwitsta/nordisk'
" ######################### OPTIONAL PLUGINS #################################### }

                                                                            " General plgins
                                                                            "---------------
" Plug 'justinmk/vim-sneak'                                                   " SearchPlug 'justinmk/vim-sneak' and jump (without highlighting and modifying the search list, maps [sS] normal mode)
" Plug 'airblade/nvim-rooter'
Plug 'rendon/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'                                       " Consistent key bindings between tmux and vim
Plug 'liuchengxu/vim-which-key'
Plug 'ThePrimeagen/vim-be-good', { 'do': ':UpdateRemotePlugins' }          " Vim game: practice relative linenr movemnets to navigate faster in vim
Plug 'kana/vim-arpeggio'                                                    " Support maps with simultaneous key presses (Emacs-like chords)
Plug 'michaeljsmith/vim-indent-object'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'vifm/vifm.vim'
Plug 'mhinz/vim-startify'                                                   " A nice startup page with possibilities to get your previous buffers up and running at the tip of your fingers
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'                                                   " Ale is a very powerful linter and fixer that works with many programming languages, a real must have (especially because it work almost out of the box) link!
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
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'                                                    " helps to end certain structures automatically. In Ruby, this means adding end after if, do, def and several other keywords. In Vimscript, this amounts to appropriately adding endfunction, endif, etc.
" Plug 'jiangmiao/auto-pairs'                                                 " autocomplete parenthesis and other brackets link


Plug  'wincent/scalpel'                                                     " Substitute word under cursor, defult binding: <leader>e
Plug  'machakann/vim-highlightedyank'                                       " Automatically highlight the yanked text
Plug  'vim-scripts/AutoComplPop'                                            " Automatically show VIM's complete menu while typing

Plug 'ChristianChiarulli/codi.vim'                                          " Interactive scratchpad to evaluate code expressions (REPL)
" Plug 'metakirby5/codi.vim'                                                " Interactive scratchpad to evaluate code expressions (REPL)

                                                                            " Ruby/Rails development specific plugins
Plug 'vim-ruby/vim-ruby'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh' } " See https://github.com/autozimu/LanguageClient-neovim

Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'mattn/emmet-vim'                                                      " emmet expansion see https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL

                                                                            " Colorschemes

Plug 'vim-scripts/CSApprox'                                       " Make gvim-only colorschemes work transparently in terminal vim
Plug 'vim-scripts/guicolorscheme.vim'                                       " Convert GUI-colorschemes to 256-color colorscheme (as good as possible): commmand :GuiColorscheme <gui-colorscheme>
Plug 'croaker/mustang-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox' " Plug 'morhetz/gruvbox'

Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/Spacegray.vim'
" Plug  'altercation/vim-colors-solarized'

                                                                             " GIT plugins
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'                                                       " :GV to open git commit browser (requires fugitive); https://github.com/junegunn/gv.vim

Plug 'airblade/vim-gitgutter'                                                " Display your changes in a gutter, undo them and preview them
                                                                             " ############ CG ##################

                                                                             " ######### From DT ###############
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}                           " Markdown preview
Plug 'frazrepo/vim-rainbow'                                                  " Highlight matching parenthesis with same color, different color for each pair (Nice for curly-brace languages)
Plug 'ap/vim-css-color'                                                      " Color previews for CSS
Plug 'junegunn/vim-emoji'                                                    " Vim need emojis
Plug 'jreybert/vimagit'                                                      " Magit like plugin for vim


                                                                             " ######### From DT ###############

                                                                             " ######### From ThePrimeagen (Vim Life Ep: Coc vs YCM) #########
                                                                             " Plug 'ycm-core/YouCompleteMe'
Plug 'jremmen/vim-ripgrep'
" Plug 'git@github.com:kien/ctrlp.vim.git'
"

" ---------------------------------- completion CoC vs. deoplete ---------------------------------{"
" Deoplete:
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi'                                       " For completion for python
"
" CoC:
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-snippets coc-tsserver coc-solargraph coc-json coc-html coc-css'}
"
" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" ---------------------------------- completion CoC vs. deoplete ---------------------------------}"



Plug 'mbbill/undotree'                                                       " UndoTreeToggle (mapped to F10 explicitly in vimrc)
                                                                             " ######### From ThePrimeagen #########

                                                                             " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

                                                                             " Any valid git URL is allowed

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


