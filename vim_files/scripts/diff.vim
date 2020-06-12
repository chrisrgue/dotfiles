
"################ Setup DIFF-settings (certain highlights + NO folds) ########
augroup aug_diffs
    au!
    " au WinEnter,BufEnter * call timer_start(50, 'CheckDiffMode')
    "Highlight VCS conflict markers
    au VimEnter,WinEnter * if !exists('w:_vsc_conflict_marker_match') |
        \ let w:_vsc_conflict_marker_match = matchadd('ErrorMsg', '^\(<\|=\||\|>\)\{7\}\([^=].\+\)\?$') |
        \ endif

    " In diff mode slightly modify diff related highlights (Diffxxxx)
    " See https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
    au BufLeave,BufEnter,BufNew,BufRead * if &diff |
                \ call s:SetupDiffSettingsForCG() |
                \ endif
augroup END


function s:SetupDiffSettingsForCG()
    if ! &diff
        return
    endif
    " See https : //stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
    " colorscheme mustang " Change colorscheme
    "
    " In diff mode slightly modify diff related highlights (Diffxxxx)
    "
    " highlight DiffAdd    cterm=bold ctermfg=none ctermbg=236 gui=none guifg=bg guibg=#303030
    " highlight DiffDelete cterm=bold ctermfg=236 ctermbg=236 gui=none guifg=#303030 guibg=#303030
    " highlight DiffChange cterm=bold ctermfg=none ctermbg=236 gui=none guifg=bg guibg=#303030
    " highlight DiffText   cterm=bold ctermfg=196 ctermbg=226 gui=none guifg=#ff0000 guibg=#ffff00

    highlight DiffAdd    cterm=bold ctermfg=none ctermbg=236 gui=none guifg=bg guibg=#303030
    highlight DiffDelete cterm=bold ctermfg=236 ctermbg=236 gui=none guifg=#000000 guibg=#000000
    highlight DiffChange cterm=bold ctermfg=none ctermbg=236 gui=none guifg=bg guibg=#303030
    highlight DiffText   cterm=bold ctermfg=196 ctermbg=226 gui=none guifg=#0000ff guibg=#afffaf

    set foldlevel=999 wrap linebreak
    " execute "normal :bufdo set foldlevel=999 wrap linebreak^M"
endfunction
command! SetupDiffSettingsForCG call s:SetupDiffSettingsForCG()

" function CheckDiffMode(timer)
"     let curwin = winnr()
"     "Check each window
"     for _win in range(1, winnr('$'))
"         exe "noautocmd " . _win . "wincmd w"
"
"         call s:change_option_in_diffmode('b:', 'syntax', 'off')
"         call s:change_option_in_diffmode('w:', 'spell', 0, 1)
"     endfor
"
"     "Get back to original window
"     exe "noautocmd " . curwin . "wincmd w"
" endfunction
"
"
" function s:change_option_in_diffmode(scope, option, value, ...)
"     let isBoolean = get(a:, "1", 0)
"     let backupVarname = a:scope . "_old_" . a:option
"
"     "Entering diff Mode
"     if &diff && !exists(backupVarname)
"         exe "let " . backupVarname . "=&" . a:option
"         call s:set_option(a:option, a:value, 1, isBoolean)
"     endif
"
"     "Exiting diff mode
"     if !&diff && exists(backupVarname)
"         let oldValue = eval(backupVarname)
"         call s:set_option(a:option, a:value, 1, isBoolean)
"         exe "unlet " . backupVarname
"     endif
" endfunction


