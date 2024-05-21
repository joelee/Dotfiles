#!/bin/bash

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"

# Install packages
if [ ! -e "${DOTFILES_LOCAL_PATH}/packages_installed" ]; then
    ${BASE_PATH}/install_packages.sh
else
    echo "Packages already been installed."
fi

dot_configure git fish alacritty kitty starship tmux

"${BASE_PATH}/../common/change-fish-shell"
