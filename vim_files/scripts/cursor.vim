" See https://vim.fandom.com/wiki/Configuring_the_cursor
"
" It is possible to change the cursor color and style in the terminal if it understands the following escape sequences. Not all terminals support this, but xterm, rxvt and Terminator do(must use nightly version for Terminator, as stable does not support cursor shape escape codes). Recent versions of gnome-terminal support the sequence to change color, but not the one to restore the color to the default. Add the following to ~/.vimrc:

if &term =~ "xterm\\|rxvt\\|screen-256color\\|termite"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif


" And changing the cursor shape (rxvt only accepts these escape sequences after version 9.21).

if &term =~ "^xterm\\|rxvt\\|screen-256color\\|termite"
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  " let &t_EI .= "\<Esc>[2 q"
  let &t_EI .= "\<Esc>[5 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
