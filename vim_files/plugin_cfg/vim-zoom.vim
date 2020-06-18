" Usage
"
" Simply use the provided mapping <C-W>m to toggle zoom in and out for the current window
" Statusline
"
" VIM Zoom provides zoom#statusline() API to be used for adding g:zoom#statustext value to your statusline while your window is zoomed. g:zoom#statustext defaults to value 'status'. You may add this to your statusline like this :
"
" set statusline+=%{zoom#statusline()}
"
" If you're using some complex statusline plugin, you may need to refer to it's documentation to figure out how to add this to your statusline.

" By default zoom-toggle is mapped to: <C-W>m (MAXIMIZE). To be consistent with tmux we map it to <C-W>z (ZOOM) instead
nmap <silent> <C-W>z <Plug>(zoom-toggle)
nmap <silent> <C-z> <Plug>(zoom-toggle)
nmap <silent> <C-m> <Plug>(zoom-toggle)
" nmap <silent> <A-z> <Plug>(zoom-toggle)

" let g:airline_section_c="%{zoom#statusline()}"

" function! s:MyStatusLine()
"     return "<FILE> %{zoom#statusline()}"
" endfunction
" let g:airline_section_c=function('s#MyStatusLine')

