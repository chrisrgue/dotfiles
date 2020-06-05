
" vifm PLUGIN }
" To use the plugin copy the vifm.vim file to either the system wide vim/plugin
" directory or into ~/.vim/plugin.
"
" If you would prefer not to use the plugin and it is in the system wide plugin
" directory add >
"
"  let loaded_vifm=1
let loaded_vifm=0
"
" to your ~/.vimrc file.
"
" Configuration variables~
"
"                                                *g:vifm*
" A string variable.  Equals "vifm" by default and specifies path to vifm's
" executable.
"
"                                                *g:vifm_exec_args*
" A string variable that specifies arguments for vifm.  Empty by default.
"
"                                                *g:vifm_term*
" A string variable that specifies command to run GUI terminal.
" By default it's equal to 'xterm -e'.
"
"                                                *g:vifm_embed_term*
" A boolean variable.  When evaluates to true and it's possible to create a
" terminal buffer, it will be used.  Enabled by default inside GUI version.
" Effectively always enabled in neovim.
"
"                                                *g:vifm_embed_split*
let g:vifm_embed_split=1
" A boolean variable.  When evaluates to true and Vifm is embedded in a
" terminal, it will be run inside a new split.  This allows commands to support
" |<mods>| and a |<count>| for controlling the orientation and size of the
" split.  False by default.
"
"                                                *g:vifm_embed_cwd*
"                                                {not on MS-Windows}
" A boolean variable.  When evaluates to true and Vifm is embedded in a
" terminal, vifm will change the active directory in vim while navigating.
" False by default.
"
"                                                *g:vifm_replace_netrw*
" A boolean variable.  When enabling this, don't forget to disable the |netrw|
" plugin (see `:h netrw-noload`), otherwise it can interfere with this plugin
" opening directories using vifm.  Defaults to false.
"
"                                                *g:vifm_replace_netrw_cmd*
" A string variable.  The command to use to open folders when
" g:vifm_replace_netrw is enabled.  Defaults to "Vifm".
"
" Extension for "vifm" filetype~
"
"                                                 *vifm-K*
" K                       Like setting 'keywordprg' to ":help vifm-" (if that
"                         would be possible), but slightly smarter.  Only mapped
"                         in vifm files.
"
" Extension for "mail" filetype~
"
" Vifm's bundle for Vim also includes a tiny mail file type extension that allows
" one to pick files for attachments via Vifm.
"
"                                                *vifm-<localleader>a*
" The function is mapped to <localleader>a key for "mail" filetype buffers only.
" It inserts files picked via Vifm as attachments ("Attach: ...") after
" "Subject" header.
"
" See also~
"
" Repository: https://github.com/vifm/vifm.vim
" Website: https://vifm.info/
" Wiki: https://wiki.vifm.info/
"
" vifm PLUGIN }
