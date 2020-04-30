#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# cd $dir && exec $HOME/bin/nvim -S $HOME/.config/nvim/last_session.vim
cd $dir && exec nvim -S $HOME/.config/nvim/last_session.vim

exit 0

