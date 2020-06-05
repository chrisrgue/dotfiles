
" vim-highlightedyank PLUGIN {
let g:highlightedyank_highlight_duration = 350
" A negative number makes the highlight persistent.
" let g:highlightedyank_highlight_duration = -1
" When a new text is yanked or user starts editing, the old highlighting would be deleted.
" Highlight coloring
" If the highlight is not visible for some reason, you can redefine the HighlightedyankRegion highlight group like:
" highlight HighlightedyankRegion cterm=reverse gui=reverse
highlight HighlightedyankRegion ctermbg=white ctermfg=blue guibg=#00C7DF
"
" Note that the line should be located after :colorscheme command execution in your vimrc.
" vim-highlightedyank PLUGIN }
