# export FZF_DEFAULT_COMMAND= 'ag --hidden --ignore .git -g ""'
# export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

export FZF_DEFAULT_OPTS="--multi --ansi --bind 'alt-a:select-all,alt-j:down,alt-k:up'"

# export FZF_DEFAULT_PREVIEW_OPTS='--preview="highlight -O ANSI {}"'
# export FZF_DEFAULT_PREVIEW_OPTS='--preview="hl {}"'

