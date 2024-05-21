#!/bin/bash

dotfiles_test () {
    echo "OK: $1"
}

backup_file () {
    if [ -e "$1" ]; then
        if [ -L "$1" ]; then
            echo "Removing symlink: $1 ..."
        else
            bak_file="$1.$(date +%y%m%d%H%M%S).bak"
            echo "  Backing up $1 => ${bak_file} ..."
            mv "$1" "${bak_file}"
        fi
    fi
}

chk_config_dir () {
    if [ ! -e "$1" ]; then
        mkdir -p "$1"
    fi
    if [ ! -d "$1" ]; then
        echo "$1 is not a directory!"
        exit 1
    fi
}

symlink_file () {
    if [ ! -e "$1" ]; then
        echo "Source file '$1' does not exists."
        exit 1
    fi
    backup_file "$2"
    echo "  Symlinking $1 => $2 ..."
    ln -s "$1" "$2"
}

copy_file () {
    if [ ! -e "$1" ]; then
        echo "Source file '$1' does not exists."
        exit 1
    fi
    backup_file "$2"
    echo "  Copying $1 => $2 ..."
    cp -f "$1" "$2"
}

dot_configure () {
    for item in "$@"; do
        cfg_script="${DOTFILES_PATH}/config/${item}/configure.sh"
        if [ ! -e "$cfg_script" ]; then
            echo "Configure file does not exists: ${cfg_script}"
            exit 0
        fi
        echo "Configuring ${item} ..."
        ${cfg_script}
    done
}
