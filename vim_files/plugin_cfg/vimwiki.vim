" See https://github.com/vimwiki/vimwiki

let g:vimwiki_list = [{'path': '~/dotfiles/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" Basic Markup
"
" = Header1 =
" == Header2 ==
" === Header3 ===
"
"
" *bold* -- bold text
" _italic_ -- italic text
"
" [[wiki link]] -- wiki link
" [[wiki link|description]] -- wiki link with description
"
" Lists
"
" * bullet list item 1
"     - bullet list item 2
"     - bullet list item 3
"         * bullet list item 4
"         * bullet list item 5
" * bullet list item 6
" * bullet list item 7
"     - bullet list item 8
"     - bullet list item 9
"
" 1. numbered list item 1
" 2. numbered list item 2
"     a) numbered list item 3
"     b) numbered list item 4
"
" For other syntax elements, see :h vimwiki-syntax
"
"
" Key bindings
" Normal mode
"
" Note: your terminal may prevent capturing some of the default bindings listed below.
" See :h vimwiki-local-mappings for suggestions for alternative bindings if you encounter a problem.
"
"
" Basic key bindings
"
"     <Leader>ww -- Open default wiki index file.
"     <Leader>wt -- Open default wiki index file in a new tab.
"     <Leader>ws -- Select and open wiki index file.
"     <Leader>wd -- Delete wiki file you are in.
"     <Leader>wr -- Rename wiki file you are in.
"     <Enter> -- Follow/Create wiki link.
"     <Shift-Enter> -- Split and follow/create wiki link.
"     <Ctrl-Enter> -- Vertical split and follow/create wiki link.
"     <Backspace> -- Go back to parent(previous) wiki link.
"     <Tab> -- Find next wiki link.
"     <Shift-Tab> -- Find previous wiki link.
"
" Advanced key bindings
"
" Refer to the complete documentation at :h vimwiki-mappings to see many more bindings.


" Commands:
"
"     :Vimwiki2HTML -- Convert current wiki link to HTML.
"     :VimwikiAll2HTML -- Convert all your wiki links to HTML.
"     :help vimwiki-commands -- List all commands.
"     :help vimwiki -- General vimwiki help docs.

