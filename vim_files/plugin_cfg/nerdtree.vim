
""""""""""""""""""""""" NERDTree config """""""""""""""""""""""""""""
let NERDTreeChDirMode=2
"let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeIgnore=['^\.svn$','\~$', '\.rbc$', '\.swp$', '\.egg-info$', '^dist$', '^build$', '\.a$', '\.o$', '\.so']
let NERDTreeSortOrder=['\.rb$', '\/$', '*']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeHightlightCursorline=1
let NERDChristmasTree=1
"open NERDTEE by default"
"autocmd vimenter * NERDTree

"Q. How can I open a NERDTree automatically when vim starts up if no files were specified?
" au! vimenter * if !argc() | NERDTree | endif

"Q. How can I map a specific key or shortcut to open NERDTree?
"A. Stick this in your vimrc to open NERDTree with Ctrl+n (you can set whatever key you want): map <C-n> :NERDTreeToggle<CR>

"Q. How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" autocmd BufWinEnter * NERDTreeFind
map ] :NERDTreeFind<CR> “ pressing this inside any open file in vim will jump to the nerdtree and highlight where that file is -> very useful when you have multiple files open at once

nnoremap <F1> :NERDTreeToggle<CR>        " Toogle NERDTree
