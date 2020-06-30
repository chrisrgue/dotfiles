" See https://github.com/mattn/emmet-vim
"
" If you don't want to enable emmet in all modes, you can use set these options in vimrc:

" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" Enable just for html/css:
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" Redefine trigger key
" To remap the default <C-Y> leader:
let g:user_emmet_leader_key=','


" Note that the trailing , still needs to be entered, so the new keymap would be <C-Z>,.
" Adding custom snippets
"
" If you have installed the web-api for emmet-vim you can also add your own snippets using a custom snippets.json file.
"
" Once you have installed the web-api add this line to your .vimrc:
"
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
"
"--------------------------------------------------------------------------------
" Examples:
"
" Type:
"       html:5
" and APPEND:
"       ,,
" (<leader>,)
"
" ==> html:5 will be expanded
"
"-------------------- Now expand the follwing 2 examples ------------------------
"
" table>thead>tr>td*3
"
" tbody>tr*5>td.a-css-class*2
"
"--------------------------------------------------------------------------------
