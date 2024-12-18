#!/bin/bash

echoerr() { printf "%s\n" "$*" >&2; }

if [ -z "${DOTFILES_HOME}" ]; then
    export DOTFILES_HOME="${HOME}/Dotfiles"
fi

if [ -z "${DOTFILES_LOCAL_PATH}" ]; then
    export DOTFILES_LOCAL_PATH="${HOME}/.local/dotfiles"
fi
if [ ! -e "${DOTFILES_LOCAL_PATH}" ]; then
    mkdir -p "${DOTFILES_LOCAL_PATH}"
fi

if [ -z "${OS_TAG}" ]; then
    if [ -n "$(which pacman)" ]; then
        export OS_TAG="arch"
    elif [ -n "$(which brew)" ]; then
        export OS_TAG="macos"
    else
        export OS_TAG="unknown"
    fi
fi

ENV_FILE="${DOTFILES_HOME}/.env"
if [ ! -e "${ENV_FILE}" ]; then
    echoerr "ENV file not found at ${ENV_FILE}"
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
        echoerr "$1 is not a directory!"
        exit 1
    fi
}

symlink_file () {
    if [ ! -e "$1" ]; then
        echoerr "Source file '$1' does not exists."
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
        echoerr "Source file '$1' does not exists."
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
            echoerr "Configure file does not exists: ${cfg_script}"
            exit 1
        fi
        echo "Configuring ${item} ..."
        echo "Test: ${cfg_script}"
    done
}

install_package () {
    echo "Installing $@ ..."
    if [ -n "$(which pacman)" ]; then
        sudo pacman -S --noconfirm $@
    elif [ -n "$(which brew)" ]; then
        brew install $@
    else
        echoerr "Package installer not found!"
        exit 1
    fi
}

check_configured () {
    MODULE="$1"
    if [ -z "${MODULE}" ]; then
        echoerr "Cannot find module."
        exit 1
    fi
    CONFIGURED_FILE="${DOTFILES_LOCAL_PATH}/${MODULE}.configured"
    if [ -e "${CONFIGURED_FILE}" ]; then
        echoerr "${MODULE} has already configured."
        echo "To reconfigure again, remove this file: ${CONFIGURED_FILE}"
        exit 1
    fi
}

mark_configured () {
    MODULE="$1"
    if [ -z "${MODULE}" ]; then
        echoerr "Cannot find module."
        exit 1
    fi
    CONFIGURED_FILE="${DOTFILES_LOCAL_PATH}/${MODULE}.configured"
    touch "${CONFIGURED_FILE}"
}
