
" vim-bookmarks plugin config.
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 0
highlight BookmarkSign ctermbg=NONE ctermfg=160 guifg=#ff0022 guibg=#3c3836
highlight BookmarkLine guifg=None guibg=#111111
"
" nnoremap  :BookmarkToggle<CR>
nnoremap <C-d> :BookmarkToggle<CR>
nnoremap <leader>bm :BookmarkToggle<CR>
" vim-bookmarks plugin config.

