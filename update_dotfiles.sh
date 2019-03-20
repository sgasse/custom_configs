#!/bin/bash

function update_file {
    if [ -f "$HOME/$1" ]; then
        echo "$1 exists, creating backup"
        mv "$HOME/$1" "$HOME/$1.backup"
    fi
    cp "$1" "$HOME/$1"
}

config_files=( ".vimrc" ".tmux.conf" ".zshrc" )

for conf in "${config_files[@]}"
do
    update_file "$conf"
done
