
" vim-which-key PLUGIN {
nnoremap <silent> <leader> :WhichKey ','<CR>
nnoremap <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>
" Pressing other keys within timeoutlen will either complete the mapping or
" open a subgroup.
"
" After pressing leader the guide buffer will pop up when there are no further
" keystrokes within timeoutlen.
"
" By default timeoutlen is 1000 ms
" set timeoutlen=500

" vim-which-key PLUGIN }
