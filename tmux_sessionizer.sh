#!/bin/bash

session=$(find ~/ ~/probe ~/unipi -mindepth 1 -maxdepth 1 -type d | fzf)
session_name=$(basename "$session" | tr . _)

if [ -z "$session" ]; then
    exit 0
fi

if ! tmux has-session -t "$session_name" 2> /dev/null; then 
    tmux new-session -s "$session_name" -c "$session" -d
fi

tmux switch-client -t "$session_name"
