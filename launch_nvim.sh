#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $dir && \
    exec ../bin/nvim -S ${dir}/../.config/nvim/last_session.vim

exit 0

