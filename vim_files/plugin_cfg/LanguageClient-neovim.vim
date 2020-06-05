
" Use autozimu/LanguageClient-neovim (see https://github.com/autozimu/LanguageClient-neovim)
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/home/cg/.local/bin/pyls'],
    \ 'ruby':   ['/home/cg/.rbenv/shims/solargraph', 'stdio'],
    \ }
    " \ 'ruby':   ['~/.gem/ruby/2.7.0/bin/solargraph', 'stdio'],
	" \ 'ruby': ['tcp://localhost:7658'],
    " \ 'ruby':   ['~/.gem/ruby/2.7.0/bin/solargraph', 'stdio'],
	" \ 'ruby': ['tcp://localhost:7658'],
    " \ 'python': ['/usr/local/bin/pyls'],
    " \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <A-F1> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>gh :call LanguageClient#textDocument_hover()<CR>

" nnoremap <silent> <C-S-F3> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <A-F2> :call LanguageClient#textDocument_rename()<CR>  " don't use <F2> (already used by pastetoggle)
nnoremap <silent> <leader>gr :call LanguageClient#textDocument_rename()<CR>

" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <A-F3> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <A-S-F1> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>gd :call LanguageClient#textDocument_definition()<CR>



    " if &softtabstop == 2

" Don't send a stop signal to the server when exiting vim.
" This is optional, but I don't like having to restart Solargraph
" every time I restart vim.
" let g:LanguageClient_loggingFile = expand('~/tmp/LanguageClient.log')
let g:LanguageClient_autoStop = 0
" let g:LanguageClient_trace = 'messages' " Valid options: 'off' | 'messages' | 'verbose'
" let g:LanguageClient_autoStop = 1   " CG; I guess =0 makes only sense when starting via 'solargraph socket' (hence avoids having to restart the solargraph socket server )

" Logging level
" Default: 'WARN'
" Valid options: 'DEBUG' | 'INFO' | 'WARN' | 'ERROR'
" let g:LanguageClient_loggingLevel = 'INFO'

" Configure ruby omni-completion to use the language client:
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

