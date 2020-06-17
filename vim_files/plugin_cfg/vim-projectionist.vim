let g:projectionist_heuristics = {
      \   "etc/rbenv.d/|bin/rbenv-*": {
      \     "bin/rbenv-*": {
      \        "type": "command",
      \        "template": ["#!/usr/bin/env bash"],
      \     },
      \     "etc/rbenv.d/*.bash": {"type": "hook"}
      \   },
      \   ".local/share/nvim/plugged/*": {
      \     "README.md": {"type": "doc"}
      \   }
      \ }
