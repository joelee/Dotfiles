#!/bin/bash

export DOTFILES_LOCAL_PATH="${HOME}/.local/dotfiles"

if [ ! -e "${DOTFILES_LOCAL_PATH}" ]; then
	mkdir -p "${DOTFILES_LOCAL_PATH}"
    touch "${DOTFILES_LOCAL_PATH}/init"
fi

if [ -e "${DOTFILES_HOME}/.env" ]; then
    source "${DOTFILES_HOME}/.env"
fi
echo "INIT: ${DOTFILES_HOME}"

source "${DOTFILES_HOME}/install/common/common_functions.bash"
