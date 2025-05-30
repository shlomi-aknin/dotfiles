#!/bin/bash

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#000000,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#000000,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
LASTDIR=/tmp/lastdir
touch $LASTDIR
DIR=/home/shlomo/Workspace
cd $DIR
SELECTED=$(fd --max-depth 1 | /home/shlomo/.local/bin/fzf --bind=ctrl-l:accept)

[ "$SELECTED" = "" ] && exit 0
echo "$DIR/$SELECTED" > $LASTDIR
cd "$DIR/$SELECTED"

current_branch=$(git rev-parse --abbrev-ref HEAD)
code $(git diff --name-only master...$current_branch)
