#!/bin/bash

echo "Work in progress: Not stable yet"
exit 0

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

BREW_FILE="${BASE_PATH}/Brewfile"

if [ -z "$(which brew)" ]; then
    echo "Homebrew was not installed."
    exit 1
fi

brew update && brew upgrade
brew bundle --file="${BREW_FILE}"

# Configure packages
dot_configure git fish alacritty kitty starship tmux
