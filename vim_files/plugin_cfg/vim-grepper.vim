 " See youtube: Nick Janetakis
 " 'Find and Replace Text in 1 or More Files Using Vim, fzf and ripgrep'
 let g:grepper={}
 let g:grepper.tools=["rg"]

 xmap gr <plug>(GrepperOperator)

 " After serching for text, press this mapping to do a project wide
 " find+replace. It's similar to <leader>r except that this one applies to all
 " matches across all files insted of just the current file.
 "
 " The ':cfdo' command applies the 'replace and update' to all entries
 " that currently exist in the quickfix list

"  nnoremap  <leader>R
"              \ :let @s='\<'.expand('<cword>').'\>'<CR>
"              \ :Grepper -cword -noprompt<CR>
"              \ :cfdo %s/<C-r>s// \| update
"              \<left><left><left><left><left><left><left><left><left><left>
