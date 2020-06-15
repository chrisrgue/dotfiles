
" vim-airline plugin config.
" let g:airline_theme='gruvbox'
let g:airline_theme='dark'
let g:airline_powerline_fonts=1 " required if using https://github.com/bling/vim-airline
" vim-airline plugin config.
"
" Automatically displays all buffers when there's only one tab open.
"
" tabline
"
" This is disabled by default; add the following to your vimrc to enable the extension:

" let g:airline#extensions#tabline#enabled = 1

" Separators can be configured independently for the tabline, so here is how you can define "straight" tabs:

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


