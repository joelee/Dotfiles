#!/bin/bash
# Create a new Brewfile from the installed packages

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

if [ "$(uname)" != "Darwin" ]; then
  echo "This script is only for macOS"
  exit 1
fi

BREW_FILE="${BASE_PATH}/Brewfile"

if [ -z "$(which brew)" ]; then
    echo "Homebrew was not installed."
    exit 1
fi

backup_file "${BREW_FILE}"
brew bundle dump --file="${BREW_FILE}"
