#!/bin/bash

if [ -z "${DOTFILES_HOME}" ]; then
    export DOTFILES_HOME="${HOME}/Dotfiles"
fi

if [ -z "${DOTFILES_LOCAL_PATH}" ]; then
    export DOTFILES_LOCAL_PATH="${HOME}/.local/dotfiles"
fi

ENV_FILE="${DOTFILES_HOME}/.env"
if [ ! -e "${ENV_FILE}" ]; then
    echo "ENV file not found at ${ENV_FILE}"
    exit 99
fi

source "${ENV_FILE}"


dotfiles_test () {
    echo "OK: $1"
}

backup_file () {
    if [ -L "$1" ]; then
        echo "Removing symlink: $1 ..."
        rm -f "$1"
    fi
    if [ -e "$1" ]; then
        bak_file="$1.$(date +%y%m%d%H%M%S).bak"
        echo "  Backing up $1 => ${bak_file} ..."
        mv "$1" "${bak_file}"
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
    if [ "$(uname)" == "Darwin" ]; then
        src_file="$(realpath $(dirname $1))/$(basename $1)"
    else
        src_file="$(realpath --relative-to=$(dirname $2) $(dirname $1))/$(basename $1)"
    fi
    chk_config_dir "$(dirname $2)"
    backup_file "$2"
    echo "  Symlinking $2 to ${src_file} ..."
    ln -s "${src_file}" "$2"
}

copy_file () {
    if [ ! -e "$1" ]; then
        echo "Source file '$1' does not exists."
        exit 1
    fi
    chk_config_dir "$(dirname $2)"
    backup_file "$2"
    echo "  Copying $1 => $2 ..."
    cp -f "$1" "$2"
}

dot_configure () {
    echo "Configuring ..."
    for item in "$@"; do
        cfg_script="${DOTFILES_PATH}/config/${item}/configure.sh"
        if [ ! -e "$cfg_script" ]; then
            echo "Configure file does not exists: ${cfg_script}"
            exit 0
        fi
        echo "Configuring ${item} ..."
        echo "Test: ${cfg_script}"
    done
}
