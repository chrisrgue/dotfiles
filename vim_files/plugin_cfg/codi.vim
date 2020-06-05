
" Codi PLUGIN {
" Example configuration for Ruby:
"           \ 'prompt': '^> ',
"           \ 'prompt': '^\(>>>\|\.\.\.\) ',
let g:codi#interpreters = {
            \ 'ruby': {
            \ 'bin': '/home/cg/.rbenv/shims/ruby',
            \ 'prompt': '^> ',
            \ },
            \ }

" Example configuration to change just the Haskell prompt:
" >
"              let g:codi#interpreters = {
"                    \ 'haskell': {
"                        \ 'prompt': '^> ',
"                        \ },
"                    \ }
" <
"              You may also set any of the |per-interpreter| options here. For
"              example, if you want to left-align all JavaScript Codi instances,
"              but keep right-align as the default:
" >
"              let g:codi#interpreters = {
"                    \ 'javascript': {
"                        \ 'rightalign': 0,
"                        \ },
"                    \ }
" <
"              Configuration is deeply applied over the default interpreters.
"              Default value is {}.
"
" Codi PLUGIN }
