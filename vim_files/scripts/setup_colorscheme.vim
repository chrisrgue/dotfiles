"----------------------  COLORSCHEME SETUP -------------------------{"
" See: https://vim.fandom.com/wiki/Using_GUI_color_settings_in_a_terminal"

if !exists('colorscheme_name')
    "  ------------------- Available colorschemes -----------------------"
    " desert darkblue industry dracula mustang apprentice spacegray
    " tender hybrid_material hybrid_reverse ayu jellybeans gruvbox industry
    "  ------------------- Available colorschemes -----------------------"
    let colorscheme_name = 'gruvbox'

    if colorscheme_name == 'ayu'
        " This file must be sourced before colorscheme/guicolorscheme is onvoked below
        " becasue it affects the ayu-vim colorscheme
        source $HOME/dotfiles/vim_files/plugin_cfg/ayu-vim.vim
    endif
endif


if version >= 700 && &term != 'cygwin' && !has('gui_running')
  " In the color terminal, try to use CSApprox.vim plugin or
  " guicolorscheme.vim plugin if possible in order to have consistent
  " colors on different terminals.
  "
  " Uncomment one of the following lines to force 256 or 88 colors if
  " your terminal supports it. Or comment both of them if your terminal
  " supports neither 256 nor 88 colors. Unfortunately, querying the
  " number of supported colors does not work on all terminals.

  set t_Co=256 "CG: Is this necessary?
  "set t_Co=88

  if &t_Co == 256 || &t_Co == 88
    " Check whether to use CSApprox.vim plugin or guicolorscheme.vim plugin.
    if has('gui') &&
      \ (filereadable(expand("$HOME/.vim/plugin/CSApprox.vim")) ||
      \  filereadable(expand("$HOME/vimfiles/plugin/CSApprox.vim")))
      let s:use_CSApprox = 1
    elseif filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim")) ||
      \    filereadable(expand("$HOME/vimfiles/plugin/guicolorscheme.vim"))
      let s:use_guicolorscheme = 1
    endif
  endif
endif
if exists('s:use_CSApprox')
  " Can use the CSApprox.vim plugin.
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
  exe 'colorscheme' colorscheme_name
elseif exists('s:use_guicolorscheme')
  " Can use the guicolorscheme plugin. It needs to be loaded before
  " running GuiColorScheme (hence the :runtime! command).
  runtime! plugin/guicolorscheme.vim
  exe 'GuiColorScheme ' colorscheme_name
else
  exe 'colorscheme' colorscheme_name
endif
"----------------------  COLORSCHEME SETUP -------------------------}"

