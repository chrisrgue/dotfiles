" See https://github.com/jremmen/vim-ripgrep
"
" value of grepformat
" let g:rg_format="%f:%l:%c:%m"
"
" let g:rg_command 	g:rg_binary --vimgrep 	search command
"
" let g:rg_highlight 	false 	true if you want matches highlighted
"
" let g:rg_derive_root 	false 	true if you want to find project root from cwd
"
" let g:rg_root_types 	['.git'] 	list of files/dir found in project root
"
" let g:rg_window_location 	botright 	quickfix window location

let g:rg_binary = 'rg'
let g:rg_command = g:rg_binary . ' --vimgrep --hidden --smart-case'
let g:rg_derive_root='true'

