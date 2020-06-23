"
"                                                         *ale-fix-configuration*
"
" Synchronous functions and asynchronous jobs will be run in a sequence for
" fixing files, and can be combined. For example:
" >
"   let g:ale_fixers = {
"   \   'javascript': [
"   \       'DoSomething',
"   \       'eslint',
"   \       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
"   \   ],
"   \}
"
" ------------ CG: standardrb is essentially a rubocop wrapper ------------ {
"  that is used to enforce RUBY STANDARD rules/guidelines
"  See https://github.com/testdouble/standard
"  It is preferred by CG over just plain rubocop rules/guidlines.
let g:ale_fixers = {
\   'ruby':        [ 'standardrb'],
\   'javascript':  [ 'eslint'],
\}
" \   'ruby':        [ 'standardrb'],
" \   'ruby':        [ 'rubocop'],
" \   'ruby':        [ 'rufo'],
" \   'ruby':        [ 'sorbet'],
" ------------ CG: standardrb is essentially a rubocop wrapper ------------ }
"
" 'rubocop' - Fix ruby files with rubocop --auto-correct.
" 'rufo' - Fix ruby files with rufo
" 'sorbet' - Fix ruby files with srb tc --autocorrect.
" 'standardrb' - Fix ruby files with standardrb --fix
"
"   ALEFix
" <
" The above example will call a function called `DoSomething` which could act
" upon some lines immediately, then run `eslint` from the ALE registry, and
" then call a lambda function which will remove every single line comment
" from the file.
"
" For buffer-local settings, such as in |g:ale_pattern_options| or in ftplugin
" files, a |List| may be used for configuring the fixers instead.
" >
"   " Same as the above, only a List can be used instead of a Dictionary.
"   let b:ale_fixers = [
"   \   'DoSomething',
"   \   'eslint',
"   \   {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
"   \]
"
"   ALEFix
" <
" For convenience, a plug mapping is defined for |ALEFix|, so you can set up a
" keybind easily for fixing files. >
"
" Files can be fixed automatically with the following options, which are all off
" by default.
"
" |g:ale_fix_on_save| - Fix files when they are saved.
let g:ale_fix_on_save = 0    " to launch fixers implicitly (upon buffer SAVE)
nmap <F8> <Plug>(ale_fix)   " Bind F8 to fixing problems with ALE

" Fixers can be disabled on save with |g:ale_fix_on_save_ignore|. They will
" still be run when you manually run |ALEFix|.


