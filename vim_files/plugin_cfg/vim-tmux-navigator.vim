" Configuration
" Custom Key Bindings
"
" If you don't want the plugin to create any mappings, you can use the five provided functions to define your own custom maps. You will need to define custom mappings in your ~/.vimrc as well as update the bindings in tmux to match.
" Vim
"
" Add the following to your ~/.vimrc to define your custom maps:
"
" let g:tmux_navigator_no_mappings = 1
"
" nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"
" Note Each instance of {Left-Mapping} or {Down-Mapping} must be replaced in the above code with the desired mapping. Ie, the mapping for <ctrl-h> => Left would be created with nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>.
" Autosave on leave
"
" You can configure the plugin to write the current buffer, or all buffers, when navigating from Vim to tmux. This functionality is exposed via the g:tmux_navigator_save_on_switch variable, which can have either of the following values:
" Value 	Behavior
" 1 	:update (write the current buffer, but only if changed)
" 2 	:wall (write all buffers)
"
" To enable this, add the following (with the desired value) to your ~/.vimrc:
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2  " Auto-save all buffers when switching fromom vim to tmux
"
" Disable While Zoomed
"
" By default, if you zoom the tmux pane running Vim and then attempt to navigate "past" the edge of the Vim session, tmux will unzoom the pane. This is the default tmux behavior, but may be confusing if you've become accustomed to navigation "wrapping" around the sides due to this plugin.
"
" We provide an option, g:tmux_navigator_disable_when_zoomed, which can be used to disable this unzooming behavior, keeping all navigation within Vim until the tmux pane is explicitly unzoomed.
"
" To disable navigation when zoomed, add the following to your ~/.vimrc:
"
" " Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
"
" Tmux
"
" Alter each of the five lines of the tmux configuration listed above to use your custom mappings. Note each line contains two references to the desired mapping.
" Additional Customization
" Restoring Clear Screen (C-l)
"
" The default key bindings include <Ctrl-l> which is the readline key binding for clearing the screen. The following binding can be added to your ~/.tmux.conf file to provide an alternate mapping to clear-screen.
"
" bind C-l send-keys 'C-l'
"
" With this enabled you can use <prefix> C-l to clear the screen.
"
" Thanks to Brian Hogan for the tip on how to re-map the clear screen binding.
