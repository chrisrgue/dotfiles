" " directories and all files (default)
let g:rooter_targets = '/,*'
"
" " ignore directories; all files
" let g:rooter_targets = '*'
"
" " ignore directories; yaml files
" let g:rooter_targets = '*.yml,*.yaml'
"
" " directories and yaml files
" let g:rooter_targets = '/,*.yml,*.yaml'
"
" To stop vim-rooter changing directory automatically:
"
" let g:rooter_manual_only = 1
"
" To specify how to identify a project's root directory:
"
let g:rooter_patterns = ['Rakefile', '.git/']
"
" Vim-rooter checks the patterns depth (height?) first. Directories must have a trailing slash. To work correctly with git submodules place .git before .git/.
"
" If a rooter pattern directory is one of the current file's ancestors, it is taken to be the project root. Otherwise, vim-rooter looks for an ancestor containing the given pattern directory/file.
"
" Note that using a symlink as a rooter pattern will probably not do what you want. Vim resolves symlinks when evaluating file paths so you will end up with the symlik source regarded as the root, not its target.
"
" To change directory for the current window only (:lcd):
"
let g:rooter_use_lcd = 1
"
" To stop vim-rooter echoing the project directory:
"
" let g:rooter_silent_chdir = 1
"
" By default vim-rooter doesn't resolve symbolic links. To resolve links:
"
let g:rooter_resolve_links = 0
"
" Using root-finding functionality in other scripts
"
" The public function FindRootDirectory() returns the absolute path to the root directory as a string, if a root directory is found, or an empty string otherwise.
"
" If that's all you need you can turn off the directory-changing behaviour with:
"
" let g:rooter_manual_only = 1

