
let g:cg_plugins = expand("~/workspace/repos/dotfiles/vim_plugins.vim")
" load plugins if available
if filereadable(g:cg_plugins)
    silent exec "source " . g:cg_plugins
endif


let g:cg_vimrc = expand("~/workspace/repos/dotfiles/.nvimrc_1")
if filereadable(g:cg_vimrc)
    silent exec "source " . g:cg_vimrc
endif

