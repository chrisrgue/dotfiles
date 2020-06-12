"
"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"



" ##################### CG: Several mechanisms to override list of plugins to be loaded ####################
" List of plugins to be loaded can be defined in several ways on the command-line:
"
" EITHER
"       - Suppress any kind of mechanism to load plugins:
"         NVIM_DONT_LOAD_PLUGINS=true nvim
" OR
"       - Specify names of plugins via $NVIM_PLUGINS_LIST:
"           NVIM_PLUGINS_LIST="dhruvasagar/vim-zoom mhinz/vim-startify tpope/vim-surround vim-airline/vim-airline ChristianChiarulli/codi.vim" nvim
" OR
"       - Specify a plugin filename in $NVIM_PLUGINS_FILENAME:
"           NVIM_PLUGINS_FILENAME=$VIM_SCRIPTS_HOME/vim_plugins_for_codi.vim nvim -O $HOME/dotfiles/ruby_completion_testfile.rb
" ##########################################################################################################

let g:cg_dont_load_plugins          = expand("$NVIM_DONT_LOAD_PLUGINS")
let g:cg_plugins_list_from_env      = expand("$NVIM_PLUGINS_LIST")
let g:cg_plugins_filename_from_env  = expand("$NVIM_PLUGINS_FILENAME")
let g:cg_plugins_filename           = filereadable(g:cg_plugins_filename_from_env)
                                        \ ? g:cg_plugins_filename_from_env
                                        \ : expand("~/dotfiles/vim_plugins.vim")

if (g:cg_dont_load_plugins != "true")

    " load plugins if available
    if ("$NVIM_PLUGINS_LIST" != g:cg_plugins_list_from_env)

        let pluginList = split(g:cg_plugins_list_from_env, " ")
        echo "Loading plugins from " . string(pluginList) . " ..."

        call plug#begin(expand('~/.local/share/nvim/plugged'))

        for plugin in pluginList
            echo "Plugging: " . plugin . " from $NVIM_PLUGINS_LIST"
            Plug plugin
        endfor

        call plug#end()
        echo "Loading plugins from " . string(pluginList) . "."

    elseif filereadable(g:cg_plugins_filename)

        silent exec "source " . g:cg_plugins_filename

    endif

endif




let g:cg_vimrc = expand("~/dotfiles/.nvimrc_1")
if filereadable(g:cg_vimrc)
    silent exec "source " . g:cg_vimrc
endif

