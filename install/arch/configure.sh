#!/bin/bash

BASE_PATH=$(dirname "$0")
source "$DOTFILES_HOME/init.sh"

# Install packages
if [ ! -e "${DOTFILES_LOCAL_PATH}/packages_installed" ]; then
    "${BASE_PATH}/install_packages.sh"
else
    echo "Packages already been installed."
fi

# Configure Local Environment
LOCAL_BIN="${HOME}/.local/bin"
if [ ! -e "${LOCAL_BIN}" ]; then
    mkdir -p "${LOCAL_BIN}"
fi

# Configure packages
dot_configure git fish alacritty kitty starship tmux

# Enable Fish Shell
"${BASE_PATH}/../common/change-fish-shell"
