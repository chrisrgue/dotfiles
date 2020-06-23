"  _       _ _         _              __      _
" (_)_ __ (_) |___   _(_)_ __ ___    / /_   _(_)_ __ ___  _ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \  / /\ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_ \ V /| | | | | | |/ /  \ V /| | | | | | | | | (__
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_/_/    \_/ |_|_| |_| |_|_|  \___|
"
" ##################### CG: Several mechanisms to override list of plugins to be loaded ####################
" List of plugins to be loaded can be defined in several ways on the command-line:
"
" EITHER
"       - Suppress any kind of mechanism to load plugins:
"         NVIM_DONT_LOAD_PLUGINS=true nvim
" OR
"       - Specify names of plugins via $NVIM_PLUGINS_LIST:
"           NVIM_PLUGINS_LIST="dhruvasagar/vim-zoom mhinz/vim-startify tpope/vim-surround vim-airline/vim-airline ChristianChiarulli/codi.vim" nvim
" OR
"       - Specify a plugin filename in $NVIM_PLUGINS_FILENAME:
"           NVIM_PLUGINS_FILENAME=$VIM_SCRIPTS_HOME/vim_plugins_for_codi.vim nvim -O $HOME/dotfiles/ruby_completion_testfile.rb
" ##########################################################################################################
"
"        _             _
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/
"
if $VIM_PLUG_HOME == "" | let $VIM_PLUG_HOME="$HOME/.local/share/nvim/plugged"  | endif
let g:cg_dont_load_plugins         = expand("$NVIM_DONT_LOAD_PLUGINS")
let g:cg_plugins_list_from_env     = expand("$NVIM_PLUGINS_LIST")
let g:cg_plugins_filename_from_env = expand("$NVIM_PLUGINS_FILENAME")
let g:cg_plugins_filename          = filereadable(g:cg_plugins_filename_from_env)
                                      \ ? g:cg_plugins_filename_from_env
                                      \ : expand("$DOTFILES_HOME/vim_plugins.vim")
if (g:cg_dont_load_plugins != "true")
    if ("$NVIM_PLUGINS_LIST" != g:cg_plugins_list_from_env)
        " Load plugins specified in list
        let pluginList = split(g:cg_plugins_list_from_env, " ")
        echo "Loading plugins from " . string(pluginList) . " ..."
        call plug#begin($VIM_PLUG_HOME)
        for plugin in pluginList
            echo "Plugging: " . plugin . " from $NVIM_PLUGINS_LIST"
            Plug plugin
        endfor
        call plug#end()
        echo "Loading plugins from " . string(pluginList) . "."
    elseif filereadable(g:cg_plugins_filename)
        " Load plugins specified in file
        silent exec "source " . g:cg_plugins_filename
    endif
endif


"        _                          _   _   _
" __   _(_)_ __ ___        ___  ___| |_| |_(_)_ __   __ _ ___
" \ \ / / | '_ ` _ \ _____/ __|/ _ \ __| __| | '_ \ / _` / __|
"  \ V /| | | | | | |_____\__ \  __/ |_| |_| | | | | (_| \__ \
"   \_/ |_|_| |_| |_|     |___/\___|\__|\__|_|_| |_|\__, |___/
"                                                   |___/
" let mapleader = "\<Space>"
" let mapleader = " "
let mapleader = ","
let maplocalleader = ","
let g:has_goyo     = match(&rtp, 'goyo') > -1
let g:has_deoplete = match(&rtp, 'deoplete') > -1
let g:has_coc      = match(&rtp, 'coc.nvim') > -1

let $PAGER=''        " setup nvim as default pager (for man pages)
set background=dark  " toggled via <S-F1> -> LightBackgroundToggle()
source $VIM_SCRIPTS_HOME/setup_colorscheme.vim

"---------- https://raw.githubusercontent.com/guoqiao/vimrc/master/vimrc ------------
" set t_Co=256 " for vim 7
if has('termguicolors') | set termguicolors | endif
syntax on
syntax enable
filetype plugin on
filetype indent on
" use stuff from vim.wikia.com example vimrc
" bottom status bar
set showmode showcmd ruler laststatus=2
set scrolloff=5 " Minimal number of screen lines to keep above and below the cursor. (default=10)
" set modeline modelines=5   " Enables modeline,VIM shall consider modelines only if a modeline is contained within 5 lines of the top or bottom of file
set nomodeline
set shada='100,n$HOME/.config/nvim/files/info/viminfo  "OBSOLETS: set viminfo='100,n$HOME/.config/nvim/files/info/viminfo
set splitbelow splitright "https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally)
set number relativenumber signcolumn=auto lazyredraw undolevels=1000
set backspace=eol,start,indent
set iskeyword+=-
set list listchars=tab:>-,trail:~,extends:>,precedes:<    " list mode, show tabs and spaces
" set textwidth=80
set wrap linebreak "this will force cursor jump to new line
" note trailing space at end of next line
set showbreak=>\ \ \
set background=dark  " toggled via <S-F1> -> LightBackgroundToggle()
set foldlevel=999
" set foldenable
" set foldmethod=indent
" set foldlevelstart=6
" set foldnestmax=10
" if ! &diff | set nowrap nolinebreak foldlevel=0 | endif
set hidden
set autoread
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set encoding=utf8
set ffs=unix,dos,mac
" Turn backup off, since most stuff is in git.
" set nobackup
set nowritebackup
set noswapfile
set undofile " make it possible to undo when reopen i.e. UNDO files are enabled, which means that UNDO will be session persistent
set completeopt=menuone,longest " also autocomplete when there is only 1 choice, only insert the longest common text of the matches

" Font configuration (only relevant for GUI vim, otherwise Font is specified
" in terminal)
" These are the basic settings to get the font to work (required):
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

"save temporary files to /tmp/
"if tmp doesn't exist, make it
" http://stackoverflow.com/a/15317146/2958070
" https://www.reddit.com/r/vim/comments/2jpcbo/mkdir_issue/
" // indicates that the file has abs path(?)
silent! call mkdir($HOME . '/.config/nvim/backup', 'p')
set backupdir=$HOME/.config/nvim/backup//
silent! call mkdir($HOME . '/.config/nvim/swap', 'p')
set directory=$HOME/.config/nvim/swap//
if exists('&undodir') " Vim 7.2 doesn't have this
    silent! call mkdir($HOME . '/.config/nvim/undo', 'p')
    set undodir=$HOME/.config/nvim/undo//
endif

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" search with ingorecase if all lowercase, otherwise case sensitive
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" add all files to find path
" :find  FILE -> find FILE and open in current window
" :sfind FILE -> find FILE and open in split
" :tabf  FILE -> find FILE and open in tab
set path=$PWD/**
" enable wildmenu above status bar
set wildmenu  " Use tab to complete stuff in vim menu, Display all matches when tab complete.
" press Tab once: show list for all match as prompt
" press Tab twice: show wildmenu for all match and use Tab again to nav
set wildmode=list:longest,full
" # Indent settings " https://stackoverflow.com/a/1878984/2958070
set autoindent
set copyindent  " copy the previous indentation on autoindenting
set smartindent
set cindent
set tabstop=4       " The width of a TAB is set to 4. Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB
set shiftwidth=4    " Indents will have a width of 4
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab       " Expand TABs to spaces
set smarttab        " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth' ('tabstop' or 'softtabstop' is used in other places.)
" Custom indent settings per filetype
augroup custom_filetype
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

    " Only use tabs in gitconfig
    " https://stackoverflow.com/questions/3682582/how-to-use-only-tab-not-space-in-vim
    autocmd BufRead,BufNewFile .gitconfig setlocal autoindent noexpandtab tabstop=8 shiftwidth=8
    autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

    " Don't highlight whitespace in xmlm html documents (as it would be done too often, see https://nvie.com/posts/how-i-boosted-my-vim/ )
    autocmd filetype html,xml set listchars-=tab:>.

    " https://superuser.com/a/907889/643441
    autocmd filetype crontab setlocal nobackup nowritebackup

    " Use 2 spaces to indent in these
    " autocmd FileType html,javascript,json,ruby,typescript,yaml setlocal shiftwidth=2 softtabstop=2
    autocmd FileType javascript,json,ruby,typescript setlocal shiftwidth=2 softtabstop=2
    autocmd FileType html,yaml   setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

    " c indent 8-space
    autocmd FileType c      setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab

    " " frontend indent 2-space
    " autocmd FileType html,yaml   setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    " " c indent 8-space
    " autocmd FileType c      setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab
augroup END


" TODO: clean up indent settings ( https://stackoverflow.com/a/1878983/2958070 )
function! IndentSpacesToggle()
    if &softtabstop == 2
        setlocal tabstop=4
        setlocal shiftwidth=4
        setlocal softtabstop=4
        setlocal expandtab
        echom "#spaces per indent = 4"
    else
        setlocal tabstop=2
        setlocal shiftwidth=2
        setlocal softtabstop=2
        setlocal expandtab
        echom "#spaces per indent = 2"
    endif
endfunction

command! IndentSpacesToggle call IndentSpacesToggle()
command! ToggleIndentSpaces call IndentSpacesToggle()
nnoremap <leader>i :IndentSpacesToggle<CR>

nnoremap <leader>q :q!<CR>

" Sometimes I dont want to indent (yaml files in particular)
command! StopIndenting setl noai nocin nosi inde=

" Set Visual Studio style indents
command! VSIndentStyle set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
" ###############################################################################

set history=9999
set tags=tags

" The maparg() function can be used to map a key even when it's already
" mapped, and have it do the original mapping too.
" Sketch:  exe 'nnoremap <Tab> ==' . maparg('<Tab>', 'n')

nnoremap ; :

" nnoremap 0 ^
" nnoremap <Space> $
" nnoremap B ^
" nnoremap E $

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" Visual select until end of line
nnoremap vv v$h
" select until end of line
" vmap <leader>E    $h
vmap $    $h

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

"################################################################################
" Smart way to move between windows
" This is now on plug in https://github.com/christoomey/vim-tmux-navigator
" which makes it also work in tmux split settings
" nnoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" nnoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<ESC><C-w><C-w>"
" nnoremap <C-n> <ESC><C-w><C-w>
nnoremap <C-j> <ESC><C-w><C-j>
nnoremap <C-k> <ESC><C-w><C-k>
nnoremap <C-l> <ESC><C-w><C-l>
nnoremap <C-h> <ESC><C-w><C-h>

" CG: Disabled due to conflict with tmux mapping (instead use <leader>+ and <leader>-)
nnoremap <silent> <C-LEFT> :vertical resize -5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <C-RIGHT> :vertical resize +5<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <C-UP> :resize -5<CR>
nnoremap <silent> <C-DOWN> :resize +5<CR>
nnoremap <silent> <M-h> :vertical resize -5<CR>
nnoremap <silent> <M-l> :vertical resize +5<CR>
nnoremap <silent> <M-k> :resize -5<CR>
nnoremap <silent> <M-j> :resize +5<CR>

nnoremap <expr> <LEFT>  (&ft == 'nerdtree') ? "<LEFT>"  : ":echom 'LEFT KEY_DISABLED_BY_CG'<CR>"
nnoremap <expr> <RIGHT> (&ft == 'nerdtree') ? "<RIGHT>" : ":echom 'RIGHT KEY_DISABLED_BY_CG'<CR>"
nnoremap <expr> <DOWN>  (&ft == 'nerdtree') ? "<DOWN>"  : ":echom 'DOWN KEY_DISABLED_BY_CG'<CR>"
nnoremap <expr> <UP>    (&ft == 'nerdtree') ? "<UP>"    : ":echom 'UP KEY_DISABLED_BY_CG'<CR>"

" Smart way to manage tabs
" nnoremap tl :tabnext<CR>
" nnoremap th :tabprev<CR>
" nnoremap tn :tabnew<CR>
" nnoremap tc :tabclose<CR>
" nnoremap tm :tabmove<CR>
" nnoremap to :tabonly<CR>


" leader affects all of vim, localleader is meant for a specific buffer, you generally use it based on a filetype. Using a localleader you can use the same leader-mapping for (slightly) different actions.
"
" Experiment with Steve Losh: http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
"
" or read more about it in the helpfiles:
"
" http://vimdoc.sourceforge.net/htmldoc/map.html#mapleader
" level 1
" jumpwah
" noremap <down> :execute ":bufdo! %d \| xa!"<cr>2 points ·
" 4 years ago
"
" :help localleader?
" level 1
" marklgr
" vimgor: good bot1 point ·
" 4 years ago
"
" <LocalLeader> is just like <Leader>, except that it uses "maplocalleader" instead of "mapleader".
" <LocalLeader> is to be used for mappings which are local to a buffer.
" Example: > :map <buffer> <LocalLeader>A oanother line<Esc>
"
" In a global plugin <Leader> should be used and in a filetype plugin
" <LocalLeader>.  "mapleader" and "maplocalleader" can be equal.  Although, if
" you make them different, there is a smaller chance of mappings from global
" plugins to clash with mappings for filetype plugins.  For example, you could
" keep "mapleader" at the default backslash, and set "maplocalleader" to an
" underscore.


nnoremap <leader>0 :Tabularize /=<CR>
vnoremap <leader>0 :Tabularize /=<CR>
nnoremap <leader>= :Tabularize /=<CR>
vnoremap <leader>= :Tabularize /=<CR>

" nnoremap <leader>- :Tabularize /-<CR>
" vnoremap <leader>- :Tabularize /-<CR>

" nnoremap <leader>. :Tabularize /:<CR>
" vnoremap <leader>. :Tabularize /:<CR>
nnoremap <leader>: :Tabularize /:<CR>
vnoremap <leader>: :Tabularize /:<CR>

" nnoremap <leader>+ :Tabularize /\<CR>
" vnoremap <leader>+ :Tabularize /\<CR>
nnoremap <leader>\ :Tabularize /\<CR>
vnoremap <leader>\ :Tabularize /\<CR>

let loaded_matchparen = 1 " disable math parenthiese

"################################################################################
if !has("gui_running")
    set confirm "open a save dialog when quitting
endif

if exists('&inccommand')
    set inccommand=split
endif


" map j to gj and k to gk, so line navigation ignores line wrap
nnoremap j gj
nnoremap k gk

nnoremap <leader>V ggVG
nnoremap <leader>A ggVG
" nnoremap <C-A> ggVG

" Tab through buffers (writes to them...)
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>





" Use bash highlighting instead of sh highlighting
" let g:is_posix = 1
let g:is_bash = 1

" Make some stuff uncopyable on HTML output
" :help :TOhtml
let g:html_prevent_copy = "fn"


" To use the clipboard on linux, install xsel
if has('clipboard')
    "Use system CLIPBOARD by as default yank register
    " ==> vapy  will copy a paragraph info CLIPBOARD
    " (otherwise I would need to : vap"+y to address CLIPBOARD register explicitly ("+)
    set clipboard^=unnamedplus,unnamed
endif

" Map jk to <Esc> to preent having to leave the home row
" inoremap jk <ESC>

" save without sudo vim
cmap w!! w !sudo tee > /dev/null %

nnoremap <expr> <C-t> (&filetype == "fzf") ? "<C-t>" : ":Term<CR>"

if has("nvim")
    " To map <Esc> to exit terminal-mode: >
    tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
    tnoremap fd  <C-\><C-n>

    " To simulate |i_CTRL-R| in terminal-mode: >
    " tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

    " To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
    if $VIM_SUPPORT_ALT_NAVIGATION == "true"
        tnoremap <A-h> <C-\><C-N><C-w>h
        tnoremap <A-j> <C-\><C-N><C-w>j
        tnoremap <A-k> <C-\><C-N><C-w>k
        tnoremap <A-l> <C-\><C-N><C-w>l
        inoremap <A-h> <C-\><C-N><C-w>h
        inoremap <A-j> <C-\><C-N><C-w>j
        inoremap <A-k> <C-\><C-N><C-w>k
        inoremap <A-l> <C-\><C-N><C-w>l
        nnoremap <A-h> <C-w>h
        nnoremap <A-j> <C-w>j
        nnoremap <A-k> <C-w>k
        nnoremap <A-l> <C-w>l
    endif

    " split settings
    " This doesn't work with my tmux plugin
    " go to next bufer
    tnoremap <C-n> <C-\><C-n><C-w><C-w>
    " Map Ctrl+ <motion> to <Terminal escape> + < Window Control> + <Motion>
    tnoremap <C-j> <C-\><C-n><C-w><C-j>
    tnoremap <C-k> <C-\><C-n><C-w><C-k>
    tnoremap <C-l> <C-\><C-n><C-w><C-l>
    tnoremap <C-h> <C-\><C-n><C-w><C-h>
    " open terminal in vertical split instead of new buffer
    command! Term :vert sp | term
    " Hopefully, this keeps buffers when I switch windows
    autocmd TermOpen * set bufhidden=hide
endif

" disable error bells
if !has("nvim")
    set nocompatible
    set visualbell t_vb=
endif


" http://stackoverflow.com/a/18444962/2958070
" custom file templates
augroup templates
    au!
    autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/skeleton.'.expand("<afile>:e")
augroup END

function! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction
command! ShowFuncName call ShowFuncName()

command! -nargs=1 Help vert help <args>

function Open(open_me)
    let open_me = expand(a:open_me)
    if has('win32')
        execute "silent !start " . a:open_me
    elseif has('mac')
        execute "silent !open " . a:open_me
    else
        execute "silent !xdg-open " . a:open_me
    endif
endfunction
command! Open call Open('%')
command! OpenDir call Open('%:p:h')


"################################################################################

"see http://vimcasts.org/episodes/the-edit-command/
" expand('%:h') -->  <dirname(CURRENT_FILE)>
" expand('%:p') -->  <CURRENT_FILE>
"e.g:  /tmp/.nvimrc_1  --> /tmp
"
" In command mode:  '%%'  -expands_to->  <dirname(CURRENT_FILE)>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" plugin)


map <leader>ee :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

noremap <leader>h :noh<CR>
noremap <leader>w :w<CR>


" noremap <leader>e :e!<CR>   " mapping already used by default by scalpel PLUGIN
noremap <leader>x :x<CR>
noremap <leader>zz :wqa<CR> " write and quit all buffers
noremap zz :qa!<CR> " quit all buffers
noremap Z :wqa!<CR> " write and quit all buffers
noremap <M-w> :wa!<CR>  " write all buffers


function! LightBackgroundToggle()
    if &background ==# 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction
command! LightBackgroundToggle call LightBackgroundToggle()
command! ToggleLightBackground call LightBackgroundToggle()


nnoremap <leader>b  :e $DOTFILES_HOME/.bashrc<CR>
nnoremap <leader>v  :e $DOTFILES_HOME/.nvimrc_1<CR>
nnoremap <leader>t  :e $DOTFILES_HOME/.tmux.conf<CR>
noremap  <leader>p  :e $DOTFILES_HOME/vim_plugins.vim<CR>
noremap  <leader>sv :source $DOTFILES_HOME/.nvimrc_1<CR>
noremap  <leader>sp :source $DOTFILES_HOME/vim_plugins.vim<CR>
nnoremap <leader>bb :ls<CR>:buffer<Space>
noremap  <leader>sc :source %<CR>
noremap  <leader>sf :source %<CR>

noremap  <leader>vv :e $MYVIMRC<CR>

if filereadable(expand("~/workspace/nvim__last_session.vim"))
    nnoremap <leader>ss :mksession! $HOME/workspace/nvim__last_session.vim
else
    nnoremap <leader>ss :mksession! $HOME/.config/nvim/last_session.vim
endif

" reload vimrc
" command! ReloadVimrc source $MYVIMRC
" command! EditVimrc :edit $MYVIMRC
command! ReloadVimrc source $MYVIMRC
command! EditVimrc :edit $MYVIMRC
" command!  -range=% -nargs=0 -bar ExpandTabs :retab<CR>
command! ExpandTabs :retab<CR>

function! s:list_colorschemes(dummy, ...)
    let file      = a:0 > 0 ? a:1 : ""
    let auto_exit = a:0 > 1 ? a:2 : 0
    " let auto_exit = auto_exit =~ '^[1-9]$'
    if file != ""
        echo 'File: '.file . ', auto_exit: '.auto_exit
        silent exec ":redir! > " . file
    endif
    let result = "" . join(filter(map(split(globpath(&rtp, 'colors/*.vim')), 'fnamemodify(v:val, ":t:r")'), 'v:val !~ " "'), " ") . "\n"
    echo result
    " echo "" . result . "\n"
    if file != ""
        silent redir END
    endif
    if auto_exit
        silent exec ":qa!"
    endif
endfunction

" On :LCS!, <bang> evaluates to '!', and '!0' becomes 1
command! -bang LCS call <SID>list_colorschemes('dummy', <args>, <bang>0)


" set t_Co=256
set guioptions-=r  "remove right hand scrollbar
set guioptions-=L  "remove left hand scrollbar

" add transparency, must be after colorscheme
function! InstallVimPlug()
    if empty(glob("~/.config/nvim/autoload/plug.vim"))
        if executable('curl')
            let plugpath = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
            silent exec "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs " . plugpath
            redraw!
            echom "Now restart the editor"
        else
            echom "Install curl"
        endif
    else
        echom "vim-plug installed!"
    endif
endfunction
command! InstallVimPlug call InstallVimPlug()

if executable("rg")
    set grepprg=rg\ --vimgrep
    " set grepformat=%f:%l:%c:%m
endif

if executable('cloc')
    command! VimConfigStats exec '!cloc --by-file-by-lang --exclude-dir=syntax,bundle,autoload,templates ~/.config/nvim'
    command! Cloc !cloc %
endif

" TODO: checkout :h formatexpr and :h formatprg

if executable('python')
    command! JSONFormat %!python -m json.tool
endif

" Format current Python file
if executable('black')
    " https://github.com/psf/black/issues/431
    command! BlackFormat %!black -q - < %
endif

if executable('gofmt')
    command! GoFormat %!gofmt %
endif

if executable('terraform')
    command! TerraFormat %!terraform fmt -no-color - < %
endif

" use zg to add word to word-list
" ]s and [s jump to misspelled words
function! SpellCheckToggle()
    if &spell
        setlocal nospell
        setlocal complete-=kspell
    else
        setlocal spell spelllang=en_us
        " turn on auto-completion with C-n, C-p
        setlocal complete+=kspell
    endif
endfunction
command! SpellCheckToggle call SpellCheckToggle()
command! ToggleSpellCheck call SpellCheckToggle()
" format existing text by selecting it and using `gq`

" command! LocalSearchHLToggle :setlocal invhlsearch
command! ToggleLocalSearchHL :setlocal invhlsearch

function! NumberToggle()
    if &number
        setlocal nonumber
    else
        setlocal number
    endif
endfunction
function! ToggleRelativeNumber()
    if &relativenumber
        setlocal norelativenumber
    else
        setlocal relativenumber
    endif
endfunction
command! NumberToggle call NumberToggle()
command! ToggleNumber call NumberToggle()
command! ToggleRelativeNumber call ToggleRelativeNumber()

" TODO: optional filename to save to
function! WriteHTML()
    silent exec "TOhtml"
    silent exec "w"
    silent exec "q"
endfunction

" http://superuser.com/a/277326/643441
command! TouchFile :call writefile([], expand("<cfile>"), "t")

function! UpByIndent()
    norm! ^
    let start_col = col(".")
    let col = start_col
    while col >= start_col
        norm! k^
        if getline(".") =~# '^\s*$'
            let col = start_col
        elseif col(".") <= 1
            return
        else
            let col = col(".")
        endif
    endwhile
endfunction
command! UpByIndent :call UpByIndent()

" http://stackoverflow.com/a/749320/2958070
" exit with :q or :diffoff
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffBufferWithSavedFile call s:DiffWithSaved()

command! FullPath echo expand('%:p')

function! SetExecutableBit()
    let fname = expand("%:p")
    checktime
    execute "au FileChangedShell " . fname . " :echo"
    silent !chmod a+x %
    checktime
    execute "au! FileChangedShell " . fname
endfunction
command! SetExecutableBit call SetExecutableBit()

" The 'e' on the end of the substitute ignores errors
" -range=% means without a visual selection the whole buffer is selected
"  Special thanks to a @jfim for the link substitution line
"  Note that top level lists can be represented by ^-, not ^*
"  TODO: handle ^# substitution in code blocks
command! -range=% -nargs=0 -bar MarkdownToJira
    \ :<line1>,<line2>s:^  - :** :e
    \ | <line1>,<line2>s:^    - :*** :e
    \ | <line1>,<line2>s:^```:{noformat}:e
    \ | <line1>,<line2>s:^# :h1. :e
    \ | <line1>,<line2>s:^## :h2. :e
    \ | <line1>,<line2>s:^### :h3. :e
    \ | <line1>,<line2>s: `: {{:eg
    \ | <line1>,<line2>s:^`:{{:e
    \ | <line1>,<line2>s:` :}} :eg
    \ | <line1>,<line2>s:`$:}}:eg
    \ | <line1>,<line2>s:`\.:}}.:eg
    \ | <line1>,<line2>s:^\d\+\. :# :e
    \ | <line1>,<line2>s/\v\[([^\]]*)\]\(([^\)]*)\)/[\1|\2]/ge

" TODO: add filtype on top?
" NOTE: add bottom one first to not mess up what's <line2>
command! -range=% -nargs=0 -bar AddCodeFence
    \ :<line2>s:$:\r```:
    \ | <line1>s:^:```\r:

" https://unix.stackexchange.com/a/58748/185953
" <line1>,<line2>VisualSelect
command! -range VisualSelect normal! <line1>GV<line2>G

" One thing I can do is hit Ctrl + x, Ctrl + e to open up my $EDITOR (NeoVim)
" to edit the long command (Bash 1-liner)
" . Now I can use all of Vim’s tricks to edit my command.
" But I’m still faced with the problem of it being all in one line,
"  hard to read and not super nice to edit.
"
" Now, when calling ^S the FormatShellCmd function AFTER having launched vim by pressing ^X^E inside BASH
" The formerly long 1-liner will be split and nicely presented in multiples lines inside the vim buffer and can be edited easily
" and when the vim instance is closed the edited long command will be executed within the BASH instance that formerly spawnwd VIM (after pressing ^X^E)
" See https://www.bbkane.com/2020/04/14/Long-Shell-Oneliners-Without-the-Pain.html
command! -range FormatShellCmd <line1>!format_shell_cmd.py

" Mostly for ordered lists in Markdown
" https://stackoverflow.com/a/4224454/2958070
command! -nargs=0 -range=% NumberLines <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
command! -nargs=0 -range=% UnNumberLines <line1>,<line2>s/\d\+\. //g

" https://askubuntu.com/a/686806/483521
command! InsertDate :execute 'norm i' .
    \ substitute(system("date '+%a %b %d - %Y-%m-%d %H:%M:%S %Z'"), '\n\+$', '', '')

" Finally, load secretive stuff not under version control
if !empty(glob("~/.config/nvim_local.vim"))
    source ~/.config/nvim_local.vim
    command! EditNvimLocal :edit ~/.config/nvim_local.vim
endif

"################################################################################
"################################################################################
"################################################################################
"################################################################################

highlight Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=LightCyan guibg=darkgrey
" set colorcolumn=80
set colorcolumn=      " type:string, defaults to ''  ==> disabled by default (can be enabled by F6 toggler)
"let &colorcolumn="80,".join(range(120,999),",")

" " cursor shape and color
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon10
" set guicursor+=i:blinkwait10
"
"

highlight Cursor guifg=white guibg=black ctermfg=red ctermbg=green
highlight iCursor guifg=red guibg=steelblue ctermfg=red ctermbg=NONE
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon1
"set guicursor+=i:blinkwait10


" Uncomment the following line if cursorline should always be highlighted
" set cursorline  " underlines current line
" set nocursorline  " underlines current line

" Only show cursorline in insert mode
" with yellow underline
" hi CursorLine gui=underline cterm=underline ctermfg=yellow guifg=yellow
" hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None ctermbg=None
" hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None
" hi CursorLine gui=None cterm=None ctermfg=black ctermbg=grey
" hi CursorLine gui=None cterm=None ctermfg=black ctermbg=lightgrey
" hi CursorLine cterm=reverse gui=reverse
" hi CursorLine gui=None cterm=None ctermfg=black ctermbg=darkgrey   " CG: used e.g. for 'textDocument_hover' (<A-F1>)
hi CursorLine gui=None guibg=#121212 guifg=#cc5fff  cterm=None ctermfg=black ctermbg=darkgrey   " CG: used e.g. for 'textDocument_hover' (<A-F1>)
" hi CursorLine gui=None guibg=blue guifg=yellow blue cterm=None ctermfg=black ctermbg=darkgrey   " CG: used e.g. for 'textDocument_hover' (<A-F1>)

" autocmd InsertEnter * set cursorline
" autocmd InsertLeave * set nocursorline

autocmd! bufwritepost vimrc source %
command! FJ % !python3 -m json.tool


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> // :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


" See https://www.tutorialdocs.com/article/vim-configuration.html

" load plugins if available
if filereadable(expand("~/.vim/pack/devpy/vimrc.pack"))
  source ~/.vim/pack/devpy/vimrc.pack
endif




"----------------- CG -------------------

""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
"Listing 1. Toggling syntax highlighting
function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction

nmap <silent>  <SPACE>s  :call ToggleSyntax()<CR>

" u is undo ==> U is redo
nmap U :redo<CR>


function! CapitalizeCenterAndMoveDown()
   s/\<./\u&/g   "Built-in substitution capitalizes each word
   center        "Built-in center command centers entire line
   +1            "Built-in relative motion (+1 line down)
endfunction

nmap <silent>  <SPACE>c  :call CapitalizeCenterAndMoveDown()<CR>

"Highlighting frequently misused words (see )

"Create a text highlighting style that always stands out...
highlight STANDOUT term=bold cterm=bold gui=bold ctermfg=yellow ctermbg=blue

"List of troublesome words...
let s:words = [
             \ "it's",  "its",
             \ "your",  "you're",
             \ "were",  "we're",   "where",
             \ "their", "they're", "there",
             \ "to",    "too",     "two"
             \ ]

"Build a Vim command to match troublesome words...
let s:words_matcher
\ = 'match STANDOUT /\c\<\(' . join(s:words, '\|') . '\)\>/'

"Toggle word checking on or off...
" Word checking is enabled by setting Vim's match command. A match expects a
" text-highlighting specification (STANDOUT in this example), followed by a
" regular expression that specifies which text to highlight. In this case,
" that regex is constructed by OR'ing together all of the words specified in
" the script's s:words list variable (that is: join(s:words, '\|')). That set
" of alternatives is then bracketed by case-insensitive word boundaries
" (\c\<\(...\)\>) to ensure that only entire words are matched, regardless of
" capitalization."
function! WordCheck ()
   "Toggle the flag (or set it if it doesn't yet exist)...
   let w:check_words = exists('w:check_words') ? !w:check_words : 1

   "Turn match mechanism on/off, according to new state of flag...
   if w:check_words
      exec s:words_matcher
   else
      match none
   endif
endfunction

"Use ;p to toggle checking...

nmap <silent>  <SPACE>wc  :call WordCheck()<CR>
command! ToggleWordCheck call WordCheck()

""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
"Scripting in Insert mode
"Vimscripting is by no means restricted to Normal mode. You can also use the imap or iabbrev commands to set up key-mappings or abbreviations that can be used while inserting text. For example:
"imap <silent> <C-D><C-U> [due: <C-R>=strftime("%d.%m.%y")]<CR>
imap <silent> <C-D><C-U> [due:  <C-R>=strftime("%d.%m.%Y") <CR>]<SPACE><SPACE>
imap <silent> <C-D><C-D> <C-R>=strftime("%02e %b. %Y")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("%02l:%M %p")<CR>
imap <silent> <C-D><C-T> <C-R>=strftime("%02e %b. %Y") . strftime("%02l:%M %p")<CR>
"With these mappings in your .vimrc, typing CTRL-D twice while in Insert mode causes Vim to call its built-in strftime() function and insert the resulting date, while double-tapping CTRL-T likewise inserts the current time.
"You can use the same general pattern to cause an insertion map or an abbreviation to perform any scriptable action. Just put the appropriate Vimscript expression or function call between an initial <C-R>= (which tells Vim to insert the result of evaluating what follows) and a final <CR> (which tells Vim to actually evaluate the preceding expression). Remember, though, that <C-R> (Vim's abbreviation for CTRL-R) is not the same as <CR> (Vim's abbreviation for a carriage return).
"For example, you could use Vim's built-in getcwd() function to create an abbreviation for the current working directory, like so:
iabbrev <silent> CWD <C-R>=getcwd()<CR>
"Or you could embed a simple calculator that can be called by typing CTRL-C during text insertions:
imap <silent> <C-C> <C-R>=string(eval(input('Calculate: ')))<CR>
"Here, the expression:
"string( eval( input("Calculate: ") ) )
"first calls the built-in input() function to request the user to type in their calculation, which input() then returns as a string. That input string is then passed to the built-in eval(), which evaluates it as a Vimscript expression and returns the result. Next, the built-in string() function converts the numeric result back to a string, which the key-mapping's <C-R>= sequence is then able to insert.


" In INSERT mode:
" when line is ending in word 'cg', the 'cg' will be subsituted with 'Chrisian Günther'
" when line is ending in word 'auth', the 'auth' will be subsituted with 'Author: Chrisian Günther'
"
iabbrev <silent> cg<C-R> Christian Günther<CR>
iabbrev <silent> auth<C-R> Author: Christian Günther<CR>



""""""" See http://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html

"Listing 11. Improving vertical copies to ignore blank lines
"  The LookUpwards() function first determines which on-screen column (or "virtual column") the insertion point is currently in, using the built-in virtcol() function. The '.' argument specifies that you want the column number of the current cursor position:
"  let column_num = virtcol('.')
"  LookUpwards() then uses the built-in search() function to look backwards through the file from the cursor position:
"  let target_pattern = '\%' . column_num . 'v.'
"  let target_line_num = search(target_pattern . '*\S', 'bnW')
"  The search uses a special target pattern (namely: \%column_numv.*\S) to locate the closest preceding line that has a non-whitespace character (\S) at or after (.*) the cursor column (\%column_numv). The second argument to search() is the configuration string bnW, which tells the function to search backwards but not to move the cursor nor to wrap the search. If the search is successful, search() returns the line number of the appropriate preceding line; if the search fails, it returns zero.
"  The if statement then works out which character—if any—is to be copied back down to the insertion point. If a suitable preceding line was not found, target_line_num will have been assigned zero, so the first return statement is executed and returns an empty string (indicating "insert nothing").
"  If, however, a suitable preceding line was identified, the second return statement is executed instead. It first gets a copy of that preceding line from the current editor buffer:
"  return matchstr(getline(target_line_num), target_pattern)
"  It then finds and returns the one-character string that the previous call to search() successfully matched:
"  return matchstr(getline(target_line_num), target_pattern)
"  Having implemented this new vertical copy behavior inside LookUpwards(), all that remains is to override the standard CTRL-Y command in Insert mode, using an imap:
"  imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>
"  Note that, whereas earlier imap examples all used <C-R>= to invoke a Vimscript function call, this example uses <C-R><C-R>= instead. The single-CTRL-R form inserts the result of the subsequent expression as if it had been directly typed, which means that any special characters within the result retain their special meanings and behavior. The double-CTRL-R form, on the other hand, inserts the result as verbatim text without any further processing.
"  Verbatim insertion is more appropriate in this example, since the aim is to exactly copy the text above the cursor. If the key-mapping used <C-R>=, copying a literal escape character from the previous line would be equivalent to typing it, and would cause the editor to instantly drop out of Insert mode.

"Locate and return character "above" current cursor position...
function! LookUpwards()
   "Locate current column and preceding line from which to copy...
   let column_num      = virtcol('.')
   let target_pattern  = '\%' . column_num . 'v.'
   let target_line_num = search(target_pattern . '*\S', 'bnW')

   "If target line found, return vertically copied character...

   if !target_line_num
      return ""
   else
      return matchstr(getline(target_line_num), target_pattern)
   endif
endfunction


"Reimplement CTRL-Y within insert mode...
" imap <silent>  <C-Y>  <C-R><C-R>=LookUpwards()<CR>
" CG: <C-Y> is already mapped by EMMET plugin ==> Map <leader>y instead
imap <silent>  <leader>y  <C-R><C-R>=LookUpwards()<CR>


""""""" See http://vim.wikia.com/wiki/VimTip315
"The following lines (in your vimrc) implement smart home for normal, visual, operator pending, and insert modes.
"The first line is an expression mapping for normal, visual, and operator pending modes. The right-hand side of the mapping is an expression that is evaluated each time Home is pressed. The expression gives a string, and the result is as if the characters in the string had been pressed. The expression compares col('.') (the cursor column position, where 1 is the first column) and match(getline('.'),'\S')+1 (the index of the first non-whitespace character in the current line; 1 is added because the index starts at 0). If both sides of "==" are equal, the result is '0' (move to start of line); otherwise it is '^' (move to first nonblank character).
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
" after executing the map, you may want to restore the mode back to insert mode.
" To do this, you can use the <CTRL-O> (oe even <C-\><C-O>) insert-mode KEY
" which temporarily goes to normal-mode for one normal mode command and then comes back to insert mode.
" See: https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
imap <silent> <Home> <C-O><Home>


""""""" See http://vim.wikia.com/wiki/VimTip431
"Change to forward/back slashesEdit
"The following mappings (for your vimrc) allow easily changing slashes in the current line.
"By default the <Leader> key is backslash, and <Bslash> is a way to refer to a backslash in a mapping, so by default these commands map \/ and \\ respectively.

"Press <Leader>/ to change every backslash to a forward slash, in the current line.

"Press <Leader>\ to change every forward slash to a backslash, in the current line.

"The mappings save and restore the search register (@/) so a previous search can be continued, if wanted. The :noh command is used to remove search highlighting (if enabled) to avoid search hits being highlighted after setting the search register.
"In the substitute command (:s), a colon (:) is used as a delimiter, so the slashes do not need to be escaped. The substitute flags (ge) cause all occurrences on the line to be substituted (g), and no error to be reported if no slash is found (e).

" nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
" nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> sl :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> bs :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>



"CG's                                                  : 'Underline current line' mapping
"----------------------------------------------------------------------------------------
"1. copy current line                                  : yyp
"2. remove trailing whitespace in copied line          : :s/\s\+$//e<cr>
"4. Jumop to startof line (ignore preceding whitespace : ^
"5. select until end of line                           : v$
"6. replace with -                                     : r-
"----------------------------------------------------------
nnoremap <leader>ul <esc>yyp:s/\s\+$//e<cr>^v$r-
nnoremap <leader>ul <esc>yyp:s/\s\+$//e<cr>^v$r-
inoremap <leader>ul <esc>yyp:s/\s\+$//e<cr>^v$r-
"----------------------------------------------------------

"Tired of clearing highlighted searches by searching for “ldsfhjkhgakjks”? Use this:
nmap <silent> <leader>/ :nohlsearch<CR>


" -----   ruby interpolation via surround plugin -----
"  35 is ASCII code for '#' : determined with :echo char2nr('#')
"  37 is ASCII code for '%' : determined with :echo char2nr('%')
"  61 is ASCII code for '=' : determined with :echo char2nr('=')
let g:surround_35 = "#{\r.inspect}"
let g:surround_37 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Expand {xyz} --> { xyz }   ( change open brace )
nnoremap cob :normal cs{{<cr>


" Press * to search for the term under the cursor or a visual selection
" and then press a key below to replace all instances of it
" in the current file/selection
nnoremap <leader>r  :%s///g<left><left>
xnoremap <leader>r  :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>
xnoremap <leader>rc :%s///gc<left><left><left>

" Type a replacement term press . to repeat the replacement again . Useful for
" replacing a few instances of the term (comparable to multiple cursors).
" The magic lies in the 'cgn' command (see http://vimcasts.org/episodes/operating-on-search-matches-using-gn/ )
" Using gn with the dot command
" Suppose that we have a document containing several occurrences of the word ‘Normal’
" and we’d like to change each occurrence to ‘Visual’.
" We can run /Normal to search for the word ‘Normal’, then type cgnVisual<Esc>
" to change the next match to the word ‘Visual’.
" You’re probably familiar with the technique of pressing n. to repeat the change for each subsequent match.
" In Practical Vim, I call this pattern of usage The Dot Formula. It lets us use two keystrokes per change.
" In this context, we can do better. The dot command repeats the last change,
" which is equivalent to typing cgnVisual<Esc>.
" We could translate that into plain English as: “change the next match”.
" We don’t have to press n. because . does the job by itself. That makes it just one keystroke per change!
nnoremap <silent>s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent>s* "sy:let @/=@s<CR>cgn

" ruby interpolation
nmap <leader>rb viwygvS#vf}S'Pli=<esc>4lva'<esc>
vmap <leader>rb    ygvS#vf}S'Pli=<esc>4lva'<esc>


" # turns  <cword>  ->  #{<cword>}
vmap <leader># viwS#
nmap <leader># viwS#

function! NextPlease(direction)
    if &diff
        if a:direction == 'n'
            execute "normal ]c"
        else
            execute "normal [c"
        endif
    else
        if a:direction == 'n'
            " " :cn<CR>
            " execute "normal :cn<CR>"
            cn
        else
            " :cp<CR>
            " execute "normal :cp" . "^M"
            " execute "normal :cp<CR>"
            cp
        endif
    endif
endfunction

" nmap .. ]c
" nmap ,, [c
" nnoremap <silent>(( :cp<CR>
" nnoremap <silent>)) :cn<CR>
nnoremap <silent>(( :call NextPlease('p')<CR>
nnoremap <silent>)) :call NextPlease('n')<CR>


function! CompileGraphvizDotFileAndShow()
  let l:fname = expand('%:p')
  GraphvizCompile
  echo "Viewing " . l:fname
  GraphvizShow
endfunction


" See http://www.bashoneliners.com/?page=2
" Make a hexdump or do the reverse with the xxd command
" bash$ xxd /path/to/binary/file
" — by openiduser3 on May 16, 2012, 8:22 a.m.
"
" Explanation
" This shows a very nice hexdump of the specified file. You can edit the output and convert it back to binary with xxd -r. But the best part is that you can configure vim to do all the converting back and forth for you, effectively turning vim into a binary editor, by adding this to your .vimrc:
"

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
    "
    au BufReadPre  *.hal let &bin=1
    au BufReadPost *.hal if &bin | %!xxd
    au BufReadPost *.hal set ft=xxd | endif
    au BufWritePre *.hal if &bin | %!xxd -r
    au BufWritePre *.hal endif
    au BufWritePost *.hal if &bin | %!xxd
    au BufWritePost *.hal set nomod | endif
augroup END



"   if wanted, you can temporarily turn off Vim's paging so there will be no "More" prompts, as shown in the following example which outputs to register A (so output is appended to register a):
"
"   :redir @A
"   :set nomore
"   :echo 'History'
"   :history
"   :echo 'Scripts loaded'
"   :scriptnames
"   :set nomore
"   :redir END
"   Redirection to a file:
"   :redir > out.txt
"   :registers
"     " any other commands
"   :redir END
"
"   The above writes to the new file out.txt. The command does nothing if that file already exists. To overwrite the file if it exists, use :redir! > out.txt. To create a new file or append to an existing file, use :redir >> out.txt.
"   Store glob results in register a:
"
"   " Clear @a (register a) because need to use A to append.
"   :let @a = ''
"
"   " Append all lines containing 'fred' to register a.
"   :g/fred/y A
"
"   " Append to a file (must use >>).
"   The command uses the :.w command which writes the current line (.) by appending it to file errors.txt.
"   :'a,'b g/^Error/ .w >> errors.txt



" Removes trailing spaces in current buffer
function! TrimWhiteSpace()
    %s/\s\+$//e
:endfunction

"automatically remove trailing whitespace before changing a file
autocmd BufWritePre     * :call TrimWhiteSpace()
" autocmd FileWritePre    * :call TrimWhiteSpace()
" autocmd FileAppendPre   * :call TrimWhiteSpace()
" autocmd FilterWritePre  * :call TrimWhiteSpace()
"Remove all trailing whitespace ( https://vim.fandom.com/wiki/Remove_unwanted_spaces )
" implicitly upon buffer write
" The following only changes files with the extension .pl:
" autocmd BufWritePre *.pl %s/\s\+$//e
" autocmd BufWritePre * %s/\s\+$//e
" Additionally, a FileType autocommand can be used to restrict the autocmd to certain file types only.
" autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

" vimwiki
":autocmd bufenter *.wiki set nofen|nmap <F3> <esc>bi[[<ESC>ea]]<ESC>1h|nmap <S-F3> <ESC>eF[F[2xf]2x1h<ESC>
":autocmd bufleave *.wiki nmap <F3> :TagbarToggle<CR>

" See http://stackoverflow.com/questions/890802/vim-disable-press-enter-or-type-command-to-continue-prompt"
"  This is how I dealt with the problem that running an external program through silent messes up the screen in text-mode vim (in my experience, gvim doesn't suffer from this problem):
"
command! -nargs=1 Silent
 \ | execute ':silent !'.<q-args>
 \ | execute ':redraw!'


" Enable spell checking -----
" set spell
"
" Disable spell checking
set nospell
"
" See https://www.andiamo.co.uk/resources/iso-language-codes for the list of available ISO 639-1 language codes
"
"   - using the ENGLISH,GERMAN and FRENCH dictionaries
set spelllang=en,de,fr
"
"   - using the AMERICAN ENGLISH dictionary
" set spelllang=en-us
"
"   - using the FRENCH dictionary
" set spelllang=fr
"
"   - using the GERMAN dictionary
" set spelllang=de
"
" ------   Enable spell checking -----

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

command! AppendModeline call AppendModeline()
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

function! ToggleColorColumn()
    if &colorcolumn
        set colorcolumn=
        echom 'ColorColumn: OFF'
    else
        set colorcolumn=120
        echom 'ColorColumn: ON (col: ' . &colorcolumn . ')'
    endif
endfunction
command! ToggleColorColumn call ToggleColorColumn()
command! ToggleNERDTree :NERDTreeToggle<cr>

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

function! ToggleWrapAndLinebreak()
    set wrap! linebreak!
    if &wrap>0
        echom 'Line wrap+break: ON'
    else
        echom 'Line wrap+break: OFF'
    endif
endfunction

function! ToggleALEFixOnSave()
    if exists("g:ale_fix_on_save")
        if g:ale_fix_on_save<1
            let g:ale_fix_on_save = 1   " to launch fixers implicitly (upon buffer SAVE)
            echom 'ALEFixOnSave: ON'
        else
            let g:ale_fix_on_save = 0
            echom 'ALEFixOnSave: OFF'
        endif
    endif
endfunction
command! ToggleALEFixOnSave call ToggleALEFixOnSave()

"-------------------- FUNCTION KEY MAPPINGS -------------------{
" -----NORMAL MODE MAPPINGS-----------
" nnoremap <F1> :NERDTreeToggle<CR>        " Toogle NERDTree
set pastetoggle=<F2>
nnoremap <F3> :call ToggleWrapAndLinebreak()<CR>
nnoremap <S-F3> :ToggleLightBackground<CR>
nnoremap <F4> :call LanguageClient_contextMenu()<CR>
nnoremap <F5> :IndentSpacesToggle<CR>
nnoremap <F6> :ToggleColorColumn<CR>
nnoremap <F7> :UndotreeToggle<cr>
" nmap <F8> <Plug>(ale_fix)   " Bind F8 to fixing problems with ALE
nnoremap <S-F8> :ToggleALEFixOnSave<CR>
nnoremap <F9> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> <BAR>:echom 'Erased trailing whitespace !' <CR> " Remove all trailing whitespace (https://vim.fandom.com/wiki/Remove_unwanted_spaces) explicitly
nnoremap <F12> :echom expand('%:p:h')<CR>
nnoremap <S-F12> :echom expand('%:p')<CR>
" ---- COMMAND MODE MAPPINGS ----------
cnoremap <F12> <C-R>=expand('%:p:h')<CR>
cnoremap <S-F12> <C-R>=expand('%:p')<CR>
" ---- INSERT MODE MAPPINGS -----------
inoremap <F12> <C-R>=expand('%:p:h')<CR>
inoremap <S-F12> <C-R>=expand('%:p')<CR>
"-------------------- FUNCTION KEY MAPPINGS -------------------}

if g:has_goyo
    " Plug undo
    " Plug goyo
    map <ENTER><ENTER> :GoyoToggle<CR>
endif



" You can insert the result of a Vim expression in insert mode using the <C-R>= command.
" See: https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" For example, the following command creates an insert mode map command that inserts the current directory:
"
" :inoremap <F2> <C-R>=expand('%:p:h')<CR>
"
" If you don't want to insert anything then you can return an empty string from the expression.
" For example, you can invoke a function from the insert mode map to perform some operation but return an empty string from the function.
"
" The <C-R>= command doesn't create a new undo point. You can also call Vim functions using the <C-R>= command:
"
" :inoremap <F2> <C-R>=MyVimFunc()<CR>
"
" If the return value of MyVimFunc() is to be ignored and not entered after its call, a ternary operator trick may be used:
"
" :inoremap <F2> <C-R>=MyVimFunc()?'':''<CR>
"
" This will return an empty string, independent of what MyVimFunc() returns.


" set mouse=a " Enables mouse support for all important modes
" set mouse=vic    " Disables mouse support for all modes except visual,insert,command modi (eg. disables mouse for normal mode)
" set mouse+=a   "Enabled mouse for all importnt modi

if exists('+ttymouse') "if !has('nvim')
    set ttymouse=sgr " To get mouse working using the Alacritty terminal emulator
endif


if exists('+guioptions')  " Only for gui vim like gvim, ...
    set guioptions-=m     " remove menubar
    set guioptions-=T     " remove toolbar
    set guioptions-=r     " remove right-hand scrollbar
    set guioptions-=L     " remove left-hand scrollbar
endif


" C-s to save file
noremap <silent> <C-s>          :update<CR>
vnoremap <silent> <C-s>         <C-C>:update<CR>
inoremap <silent> <C-s>         <ESC>:update<CR>


" Move visual selection 1-line up DOWN/UP
" shouldn't be mapped to j/k because by default those expand/shrink the selection linewise
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv   " Move visual selection up


" ####### Copy and Paste #######

" Copy only to clipboard register (@+)
" vnoremap <C-c>      "+y
" Copy first to primary selection register (@*), then copy from primary selection register to clipboard register (@+)
vnoremap <C-c>      "*y :let @+=@*<CR>

" Paste content of clipboard register (@+)
noremap <C-v>      "+p


" " setup nvim as default pager (for man pages)
" let $PAGER=''


" Some tricks from https://github.com/bbkane/dotfiles/blob/91ac752ac4a25eca1f3ff271249d2e5878b265b2/nvim/.config/nvim/init.vim#L397


" Most completion engines expect you to use the arrow keys to select
" from suggestion dropdowns while coding
" which isn’t ideal for most Vim users and hence it is recommended
" to map the ctrl-j and ctrl-k bindings to the up and down arrow keys.
" This can be achieved by adding the following lines to your ‘init.vim’
" configuration file (pumvisibible: 'PopUpMenu Visible'):
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

source $VIM_SCRIPTS_HOME/quickfix.vim
source $VIM_SCRIPTS_HOME/diff.vim
source $VIM_SCRIPTS_HOME/cursor.vim


"  ____  _             _              ____             __ _
" |  _ \| |_   _  __ _(_)_ __        / ___|___  _ __  / _(_) __ _
" | |_) | | | | |/ _` | | '_ \ _____| |   / _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | |_____| |__| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|      \____\___/|_| |_|_| |_|\__, |
"                |___/                                      |___/
source $VIM_PLUG_CFG_HOME/goyo.vim
source $VIM_PLUG_CFG_HOME/nerdtree.vim
source $VIM_PLUG_CFG_HOME/vim-zoom.vim
source $VIM_PLUG_CFG_HOME/vim-rainbow.vim
source $VIM_PLUG_CFG_HOME/vim-airline.vim
source $VIM_PLUG_CFG_HOME/vim-bookmarks.vim
source $VIM_PLUG_CFG_HOME/tcomment_vim.vim
source $VIM_PLUG_CFG_HOME/LanguageClient-neovim.vim
source $VIM_PLUG_CFG_HOME/deoplete.vim
source $VIM_PLUG_CFG_HOME/startify.vim
source $VIM_PLUG_CFG_HOME/auto-pairs.vim
source $VIM_PLUG_CFG_HOME/ale.vim
source $VIM_PLUG_CFG_HOME/sneak.vim
source $VIM_PLUG_CFG_HOME/vim-highlightedyank.vim
source $VIM_PLUG_CFG_HOME/scalpel.vim
source $VIM_PLUG_CFG_HOME/codi.vim
source $VIM_PLUG_CFG_HOME/vifm.vim
source $VIM_PLUG_CFG_HOME/arpeggio.vim
source $VIM_PLUG_CFG_HOME/rnvimr.vim
source $VIM_PLUG_CFG_HOME/vim-be-good.vim
source $VIM_PLUG_CFG_HOME/vim-which-key.vim
source $VIM_PLUG_CFG_HOME/coc.vim
source $VIM_PLUG_CFG_HOME/vim-tmux-navigator.vim
source $VIM_PLUG_CFG_HOME/vim-rooter_rendon.vim
source $VIM_PLUG_CFG_HOME/fzf.vim
source $VIM_PLUG_CFG_HOME/vim-ripgrep.vim
source $VIM_PLUG_CFG_HOME/vim-grepper.vim
source $VIM_PLUG_CFG_HOME/vim-projectionist.vim
source $VIM_PLUG_CFG_HOME/vim-dispatch.vim
source $VIM_PLUG_CFG_HOME/neo-pipe.vim
" source $VIM_PLUG_CFG_HOME/ultisnips.vim


" LAST LINE
