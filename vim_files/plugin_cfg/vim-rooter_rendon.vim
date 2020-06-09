" See https://github.com/rendon/vim-rooter
"
"
" Configuration
"
" You can change the manual-invocation mapping by adding this to your .vimrc:
"
map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
"
" where <Leader>foo is the mapping you want.
"
" To prevent vim-rooter from creating a mapping, do this:
"
" let g:rooter_disable_map = 1
"
" By default all files trigger vim-rooter. You can restrict the files by passing a comma separated list of extensions like this:
"
" let g:rooter_autocmd_patterns = '*.rb,*.haml,*.js'
"
" To stop vim-rooter changing directory automatically, add this to your .vimrc:
"
" let g:rooter_manual_only = 1
"
" You can set your own directory and file patterns like this:
"
let g:rooter_patterns = ['Rakefile', '.git/']
"
" Vim-rooter checks the patterns depth-first in the order given. So to work correctly with git submodules you should have .git before .git/. All directories should have a trailing slash.
"
" Setting your own patterns overwrites the defaults. You can use
"
" let g:rooter_patterns = g:rooter_patterns + [ 'foo' ]
"
" to append to the default patterns.
"
" You can have vim-rooter locally change directory (:lcd) instead of changing directory (:cd) by adding this to your .vimrc:
"
" let g:rooter_use_lcd = 1
"
" When vim-rooter encounters a non-project file, it won't change directory by default. If you would instead like vim-rooter to change to the file's directory, do this:
"
" let g:rooter_change_directory_for_non_project_files = 1
"
" This makes vim-rooter behave similarly to autochdir for non-project files.
"
" If you don't want vim-rooter to echo the project directory, try this:
"
" let g:rooter_silent_chdir = 1
