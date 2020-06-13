"        _                       _             _
" __   _(_)_ __ ___        _ __ | |_   _  __ _(_)_ __  ___
" \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` | | '_ \/ __|
"  \ V /| | | | | | |_____| |_) | | |_| | (_| | | | | \__ \
"   \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |_|_| |_|___/
"                         |_|            |___/
"
call plug#begin("$HOME/.local/share/nvim/plugged")                       " For Neovim: stdpath('data') . '/plugged'
                                                                            " Avoid using standard Vim directory names like 'plugin'
Plug 'rendon/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'                                       " Consistent key bindings between tmux and vim
Plug 'liuchengxu/vim-which-key'
Plug 'ThePrimeagen/vim-be-good', { 'do': ':UpdateRemotePlugins' }           " Vim game: practice relative linenr movemnets to navigate faster in vim
Plug 'kana/vim-arpeggio'                                                    " Support maps with simultaneous key presses (Emacs-like chords)
Plug 'michaeljsmith/vim-indent-object'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'vifm/vifm.vim'
Plug 'mhinz/vim-startify'                                                   " A nice startup page with possibilities to get your previous buffers up and running at the tip of your fingers
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'                                                   " Ale is a very powerful linter and fixer that works with many programming languages, a real must have (especially because it work almost out of the box) link!
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-zoom'
Plug 'https://gitlab.com/tsingyixy/vim-bookmarks'
Plug 'tpope/vim-endwise'                                                    " helps to end certain structures automatically. In Ruby, this means adding end after if, do, def and several other keywords. In Vimscript, this amounts to appropriately adding endfunction, endif, etc.
Plug 'wincent/scalpel'                                                      " Substitute word under cursor, defult binding: <leader>e
Plug 'machakann/vim-highlightedyank'                                        " Automatically highlight the yanked text
Plug 'ChristianChiarulli/codi.vim'                                          " Plug 'metakirby5/codi.vim' Interactive scratchpad to evaluate code expressions (REPL)
Plug 'vim-ruby/vim-ruby'                                                    " ???
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'} " See https://github.com/autozimu/LanguageClient-neovim
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'mattn/emmet-vim'                                                      " emmet expansion see https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'                                                      " :GV to open git commit browser (requires fugitive); https://github.com/junegunn/gv.vim
Plug 'airblade/vim-gitgutter'                                               " Display your changes in a gutter, undo them and preview them
Plug 'jreybert/vimagit'                                                     " Magit like plugin for vim
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}                          " Markdown preview
Plug 'frazrepo/vim-rainbow'                                                 " Highlight matching parenthesis with same color, different color for each pair (Nice for curly-brace languages)
Plug 'ap/vim-css-color'                                                     " Color previews for CSS
Plug 'junegunn/vim-emoji'
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-snippets coc-tsserver coc-solargraph coc-json coc-html coc-css'}
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'SirVer/ultisnips'
"   ____      _                     _
"  / ___|___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  ___
" | |   / _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \/ __|
" | |__| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/\__ \
"  \____\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___||___/
"
Plug 'vim-scripts/CSApprox'                                                 " Make gvim-only colorschemes work transparently in terminal vim
Plug 'vim-scripts/guicolorscheme.vim'                                       " Convert GUI-colorschemes to 256-color colorscheme (as good as possible): commmand :GuiColorscheme <gui-colorscheme>
Plug 'ChristianChiarulli/onedark.vim'
Plug 'kaicataldo/material.vim'
Plug 'croaker/mustang-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/Spacegray.vim'

"   ___        _   _                   _
"  / _ \ _ __ | |_(_) ___  _ __   __ _| |
" | | | | '_ \| __| |/ _ \| '_ \ / _` | |
" | |_| | |_) | |_| | (_) | | | | (_| | |
"  \___/| .__/ \__|_|\___/|_| |_|\__,_|_|
"       |_|
" Plug 'morhetz/gruvbox'
" Plug 'romainl/Apprentice'
" Plug 'jacoborus/tender.vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'dracula/vim'
" Plug 'altercation/solarized'
" Plug 'sickill/vim-monokai'
" Plug 'kamwitsta/nordisk'
" Plug 'altercation/vim-colors-solarized'
" Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'ycm-core/YouCompleteMe'                                             " For typescript
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi'                                     " For completion for python
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'fatih/vim-go', { 'tag': '*' }                                       " Using non-master branch by using any (*) tagged release
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plug 'junegunn/vim-github-dashboard'                                      " Browse GitHub events (user dashboard, user/repo activity) in Vim.
" Plug 'junegunn/vim-easy-align'
" Plug 'lyuts/vim-rtags'                                                    " RTags is a client/server application that indexes C/C++ code and keeps a persistent file-based database of references, declarations, definitions, symbolnames etc. There’s also limited support for ObjC/ObjC++.
" Plug 'vim-utils/vim-man'                                                  " Open man pages in vim (splits)
" Plug 'easymotion/vim-easymotion'                                          " Plug  'joequery/Stupid-EasyMotion'
" Plug 'vimwiki/vimwiki'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'tpope/vim-unimpaired'
" Plug 'jiangmiao/auto-pairs'                                               " autocomplete parenthesis and other brackets link
" Plug 'vim-scripts/AutoComplPop'                                           " Automatically show VIM's complete menu while typing
" Plug 'justinmk/vim-sneak'
" Plug 'airblade/nvim-rooter'

call plug#end()

