" See: https://github.com/coachshea/neo-pipe
"
" run the command continuously
let g:npipe_type='c'

" default command through which will be piped
let g:npipe_com = 'bash'
au filetype sql let b:npipe_com = 'sqlite3 ~/db/myDatabase.db'
au filetype mongo let b:npipe_com = 'mongo'

" with b:npipe_type='s'
au filetype livescript let b:npipe_com = 'lsc -cb'

au filetype ruby  let b:npipe_type='t' | let b:npipe_com = 'pry'
au filetype sh    let b:npipe_type='t' | let b:npipe_com = 'bash'
au filetype vim   let b:npipe_type='t' | let b:npipe_com = 'bat'

" run command in a terminal buffer
" au filetype ruby let b:npipe_type='t'

" run the command each time
au filetype coffe let b:npipe_type='s'

" echo the text in the scratch buffer
au filetype txt let b:npipe_type=0
