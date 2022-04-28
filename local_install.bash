#!/usr/bin/env bash

shopt -s dotglob

link_location="$HOME"
force=false

while getopts ":f" opt "$@"; do
    case $opt in
        f)
            force=true
            ;;
    esac
done

link_file() {
    if [ -d "$1" ]; then
        for FILE in "$1"/*; do
            link_file "$FILE"
        done
    elif [ -f "$1" ]; then
        link_path="$link_location/$1"
        full_path=`realpath "$1"`
        if [ ! -f "$link_path" ]; then
            echo "Linking $full_path to $link_path"
            mkdir -p "${link_path%/*}"
            ln -s "$full_path" "$link_path"
        elif [ $force == true ]; then
            echo "Deleting Existing File $link_path"
            echo "Linking $full_path to $link_path"
            ln -fs "$full_path" "$link_path"
        else
            echo "Couldn't link $1, file already exists ('$link_path')"
        fi
    else
        echo "Couldn't link $1, no such file or directory"
    fi
}

install() {
    to_link=("$@")
    for link in "${to_link[@]}"; do
        link_file "$link"
    done
}

