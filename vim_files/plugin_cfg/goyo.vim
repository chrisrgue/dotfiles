
" ##########  goyo and limelight {
" let g:goyo_width  = 90   " (default: 80)
" let g:goyo_height = '90%' " (default: 85%)
" let g:goyo_linenr = 0     " (default: 0)

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set nocursorline
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set cursorline
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction


let g:goyo_is_open = 0
function! s:goyo_toggle()
    if g:goyo_is_open
        Goyo!
		" call <SID>goyo_leave()
        let g:goyo_is_open = 0
    else
		" call <SID>goyo_enter()
        Goyo 90x90%
        let g:goyo_is_open = 1
    endif
endfunction


autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

command! GoyoToggle :call <SID>goyo_toggle()

" ##########  goyo and limelight }

