#!/bin/bash

function create_link {
    if [ -f "$HOME/$1" ]; then
        echo "$1 exists, creating backup"
        mv "$HOME/$1" "$HOME/$1.backup"
    fi
    ln -s "$1" "$HOME/$1"
}

config_files=( ".vimrc" ".tmux.conf" ".zshrc" )

for conf in "${config_files[@]}"
do
    create_link "$conf"
done
