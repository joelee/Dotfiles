#!/bin/bash

BASE_PATH=$(dirname "$0")

# Install packages
if [ ! -e "${DOTFILES_LOCAL_PATH}/packages_installed" ]; then
    echo "${BASE_PATH}/install_packages.sh"
else
    echo "Packages already been installed."
fi

# Configure Local Environment
LOCAL_BIN="${HOME}/.local/bin"
if [ ! -e "${LOCAL_BIN}" ]; then
    mkdir -p "${LOCAL_BIN}"
fi

# Configure packages
echo "dot_configure git fish alacritty kitty tmux"

