autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType ruby let b:dispatch = 'pry -I $DOTFILES_HOME -r %'
" autocmd FileType ruby let b:dispatch = 'rspec %'
" :Dispatch rspec %
