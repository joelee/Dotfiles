#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"
export DOTFILES_PATH="$(pwd)"
export DOTFILES_LOCAL_PATH="${HOME}/.local/dotfiles"

if [ ! -e "${DOTFILES_LOCAL_PATH}" ]; then
	mkdir -p "${DOTFILES_LOCAL_PATH}"
    touch "${DOTFILES_LOCAL_PATH}/init"
fi

if [ -e "${DOTFILES_PATH}/.env" ]; then
    source "${DOTFILES_PATH}/.env"
fi
echo "INIT: ${DOTFILES_PATH}"

source "${DOTFILES_PATH}/install/common/common_functions.bash"

# ${DOTFILES_PATH}/config/git/configure.sh
