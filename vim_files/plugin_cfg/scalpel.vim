
" scalpel/scalpel PLUGIN {
"" The mapping can be suppressed by setting:
"
" ```
" let g:ScalpelMap=0
" ```
"
" Or overridden:
"
" ```
" " Use <Leader>s instead of default <Leader>e:
" nmap <Leader>s <Plug>(Scalpel)
" ```
"
" In any case, Scalpel won't overwrite any pre-existing mapping that you might
" have defined for `<Leader>e`, nor will it create an unnecessary redundant
" mapping if you've already mapped something to `<Plug>(Scalpel)`.
"
" The `:Scalpel` command name can be overridden if desired. For example, you
" could shorten it to `:S` with:
"
" ```
" let g:ScalpelCommand='S'
" ```
"
" Then your Scalpel prompt would look like:
"
" ```
" :S/\v<foo>//
" ```
"
" The command can be entirely suppressed by setting `g:ScalpelCommand` to an
" empty string:
"
" ```
" let g:ScalpelCommand=''
" ```
"
" Finally, all plug-in functionality can be deactivated by setting:
"
" ```
" let g:ScalpelLoaded=1
" ```
"
" in your `~/.vimrc`.
"
" scalpel/scalpel PLUGIN }
