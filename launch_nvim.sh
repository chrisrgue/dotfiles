#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

last_session_file=~/workspace/nvim__last_session.vim
[ -r $last_session_file ] || last_session_file=~/.config/nvim/last_session.vim

cd $dir && exec nvim -S $last_session_file

exit 0

