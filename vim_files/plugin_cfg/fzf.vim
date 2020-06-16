" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
let g:fzf_history_dir = '~/.local/share/fzf-history'


map <leader>ff              :Files<CR>
nnoremap <silent><A-f>      :Files<CR>
map <leader>bb              :Buffers<CR>
nnoremap <leader>t          :Tags<CR>
nnoremap <leader>m          :Marks<CR>
nnoremap <silent> <leader>f :FZF<CR>
" nnoremap <silent><C-g>      :RG<CR>  <C-g> shows filename by default
" search for term under cursor
nnoremap <silent><A-g>      :RG<CR>
" nnoremap <silent><leader>S  :RG expand('<cword>')<CR>

" nnoremap  <leader>S
"             \ :let @s=''.expand('<cword>')<CR>
"             \ :Rg <C-r>s

" Search Project for word under cursor
" nnoremap  <M-s> :let @s=''.expand('<cword>')<CR>:Rg <C-r>s
" Search Project for word under cursor
nnoremap  <leader>S :let @b=shellescape(expand('<cword>'))<CR>:Rg <C-r>b<CR>
nnoremap  <M-s>     :let @b=shellescape(expand('<cword>'))<CR>:Rg <C-r>b<CR>
" Search Project for selection
" 2nd <CR> after 'Rg' was running ensures that first match-file (listed now in QUICKFIX-list) is jumed to
" The trailing 'gv' ensures that the search is selected again inside that match-file
" so that a subsequent ',R' will pick up and hence replace that same selection in the entire project
vnoremap  <leader>S "sy<bar>:let @b = shellescape(escape(@s, '\\.*$^~[]'))<cr>:Rg <C-r>b<CR><CR>gv
vnoremap  <M-s>     "sy<bar>:let @b = shellescape(escape(@s, '\\.*$^~[]'))<cr>:Rg <C-r>b<CR><CR>gv
" Replace word under cursor in entire project
nnoremap  <leader>R  :let @b='\<'.expand('<cword>').'\>'<CR>
             \ :cfdo %s/<C-r>b//g \| update
             \<left><left><left><left><left><left><left><left><left><left><left>
" Replace selection in entire project
" vnoremap  <leader>R  "ay<bar>:let @s = shellescape(escape(@a, '\\/.*$^~[]'))<cr>
"             \ :cfdo %s/<C-r>s//g \| update
"             \<left><left><left><left><left><left><left><left><left><left><left>
vnoremap  <leader>R  "sy<bar>:let @b = escape(@s, '\\/.*$^~[]')<cr>
            \ :cfdo %s/<C-r>b//g \| update
            \<left><left><left><left><left><left><left><left><left><left><left>

nnoremap <leader>g          :RG<CR>
" nnoremap <silent><C-f>      :FZF<CR>   " C-f conflicts with '½ page down' default VIM behavior


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

if $FZF_DEFAULT_PREVIEW_OPTS == ""
    let g:fzf_preview_opts = []
else
    let g:fzf_preview_opts = [ $FZF_DEFAULT_PREVIEW_OPTS ]
endif

if $FZF_DEFAULT_OPTS == ""
    " let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
    let $FZF_DEFAULT_OPTS = ' --multi --layout=reverse --info=inline --ansi --bind "alt-a:select-all,alt-j:down,alt-k:up" ' . $FZF_DEFAULT_PREVIEW_OPTS
else
    let $FZF_DEFAULT_OPTS =  '' . $FZF_DEFAULT_OPTS . ' --layout=reverse --info=inline ' . $FZF_DEFAULT_PREVIEW_OPTS
endif

" https://superuser.com/questions/1103963/neovim-fzf-hidden-files
if $FZF_DEFAULT_COMMAND == ''
    " let $FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
    let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
endif

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" "Get Files
" command! -bang -nargs=? -complete=dir Files
"             \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--multi', '--ansi', '--layout=reverse', '--info=inline'] + g:fzf_preview_opts}), <bang>0)

" You can just omit the spec argument if you only want the previewer.
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>1)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden  --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command] + g:fzf_preview_opts}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" " On :LS!, <bang> evaluates to '!', and '!0' becomes 1
" command! -bang LS call fzf#run(fzf#wrap({'source': 'ls'}, <bang>0))

" The query history for this command will be stored as 'ls' inside g:fzf_history_dir.
" The name is ignored if g:fzf_history_dir is not defined.
command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))


