
if g:has_deoplete
    if g:has_coc
        "Use coc instead
        let g:deoplete#enable_at_startup = 0
    else
        "Use deoplete
        let g:deoplete#enable_at_startup = 1
    endif
    set omnifunc=LanguageClient#complete
    let g:LanguageClient_diagnosticsEnable = 0

    " let s:default_sources = ['syntax', 'tag', 'buffer', 'file', 'ultisnips']
    " let s:default_sources = ['solargraph', 'syntax', 'tag', 'buffer', 'file', 'ultisnips', 'fzf']
    let s:default_sources = ['solargraph', 'syntax', 'tag', 'ultisnips']

    call deoplete#custom#option('sources', {
            \ '_': s:default_sources,
            \ 'go':          [ 'LanguageClient'] + s:default_sources,
            \ 'cs':          [ 'cs'] + s:default_sources,
            \ 'javascript':  [ 'LanguageClient'] + s:default_sources,
            \ 'typescript':  [ 'LanguageClient'] + s:default_sources,
            \ 'ruby':        [ 'LanguageClient'] + s:default_sources,
            \ 'eruby':       [ 'LanguageClient'] + s:default_sources,
            \ 'c':           [ 'clang2'] + s:default_sources,
            \ 'cpp':         [ 'clang2'] + s:default_sources,
            \ 'objc':        [ 'clang2'] + s:default_sources,
            \ 'objcpp':      [ 'clang2'] + s:default_sources,
            \ 'lua':         [ 'omni'] + s:default_sources,
            \ 'java':        [ 'javacomplete2'] + s:default_sources,
            \})"
endif
