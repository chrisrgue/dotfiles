" See https://vi.stackexchange.com/questions/8855/how-can-i-change-the-default-grep-call-grepprg-to-exclude-directories
" or
" See https://www.reddit.com/r/vim/comments/7i1yv8/how_do_you_search_for_a_string_in_all_files_under


" configure :grep/:lgrep  to usee rg (ripgrep) instead of grep to speed up filee searching


" function! GetBufferList()
"   redir =>buflist
"   silent! ls!
"   redir END
"   return buflist
" endfunction
"
"
" function! ToggleList(bufname, pfx)
"   let buflist = GetBufferList()
"   for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
"     if bufwinnr(bufnum) != -1
"       exec(a:pfx.'close')
"       return
"     endif
"   endfor
"   if a:pfx == 'l' && len(getloclist(0)) == 0
"       echohl ErrorMsg
"       echo "Location List is Empty."
"       return
"   endif
"   let winnr = winnr()
"   exec(a:pfx.'open')
"   if winnr() != winnr
"     wincmd p
"   endif
" endfunction
"
"
" nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
" " nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>



" command -bang -nargs=? QFix call QFixToggle(<bang>0)
" function! QFixToggle(forced)
"   if exists("g:qfix_win") && a:forced == 0
"     cclose
"     unlet g:qfix_win
"   else
"     copen 10
"     let g:qfix_win = bufnr("$")
"   endif
" endfunction
"
" " Calling ':QFix' will "toggle" the quickfix open and closed. It's easiest to map this to something fast. I use:
"
" " nmap <silent> \` :QFix<CR>
" nmap <silent> <leader>l :QFix<CR>

" noremap <leader>q :q<CR>
" nnoremap Q <nop>  " Dont enter EX-mode by presssing 'Q' (default vim behavior)
"
" nnoremap Q :call QuickfixToggle()<cr>

" let g:quickfix_is_open = 0
" function! QuickfixToggle()
"     if g:quickfix_is_open
"         cclose
"         let g:quickfix_is_open = 0
"         " go back to the window/split where we came from
"         " before entering the QUICKFIX window
"         execute g:quickfix_return_to_window . "wincmd w"
"     else
"         let g:quickfix_return_to_window = winnr()
"         copen
"         let g:quickfix_is_open = 1
"     endif
" endfunction

"""""""
" toggles the quickfix window.
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        " go back to the window/split where we came from
        " before entering the QUICKFIX window
        execute g:quickfix_return_to_window . "wincmd w"
    else
        " save the window/split where we came from
        let g:quickfix_return_to_window = winnr()
        execute "copen " . g:jah_Quickfix_Win_Height
    endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END


let g:jah_Quickfix_Win_Height = 10
nmap <silent> <leader>l :QFix<CR>
nnoremap Q :QFix<cr>
"""""""


