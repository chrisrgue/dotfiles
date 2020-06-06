
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


" Hide statusline
" Since the theme of provided statusline is not flexible and all the information has been echoed already, I prefer to hide it.
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


let g:which_key_vertical = 0             "  show popup vertically
" let g:which_key_position = 'botright'  "  split a window at the bottom
let g:which_key_position = 'topleft'     "  split a window at the bottom
let g:which_key_hspace   = 5             "  minimum horizontal space between columns

" vim-which-key PLUGIN }
