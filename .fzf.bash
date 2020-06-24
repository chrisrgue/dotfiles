export AG_PREFIX='ag --hidden --ignore .git -g ""'
export FIND_PREFIX="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export RG_PREFIX="rg --files --hidden --follow --glob '!.{git,svn,cvs}' --color=always --smart-case "
export FZF_DEFAULT_COMMAND="$RG_PREFIX"
export FZF_DEFAULT_PREVIEW_OPTS='--preview="bat {}"'   # export FZF_DEFAULT_PREVIEW_OPTS='--preview="highlight -O ANSI {}"'
export FZF_DEFAULT_OPTS="--multi --ansi --bind 'alt-a:select-all,alt-j:down,alt-k:up,ctrl-r:reload($RG_PREFIX)' ${FZF_DEFAULT_PREVIEW_OPTS}"

export FZF_COMPLETION_TRIGGER='**'          # change ** (=default) to whatever you like
# Directories under current directory (single-selection)
# cd **<TAB>
#
# Files under your home directory (multi-selection)
# vim ~/**<TAB>
#
# Host names are extracted from /etc/hosts and ~/.ssh/config
# ssh **<TAB># Environment variables
#
# unset **<TAB>
# export **<TAB># Aliases
# unalias **<TAB>
