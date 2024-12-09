#!/bin/bash

source "$(dirname $0)/common/common_functions.bash"

if [ -z "${DOTFILES_HOME}" ]; then
    echo "DOTFILES_HOME was not set."
    exit 1
fi

if [ ! -e "${DOTFILES_LOCAL_PATH}" ]; then
    mkdir -p "${DOTFILES_LOCAL_PATH}"
    touch "${DOTFILES_LOCAL_PATH}/init"
fi

if [ -e "${DOTFILES_HOME}/.env" ]; then
    source "${DOTFILES_HOME}/.env"
else
    echo "Missing .env file."
    exit 1
fi

OS_NAME="$1"

echo "INIT ${OS_NAME}: ${DOTFILES_HOME}"


if [ -z "${OS_NAME}" ]; then
    echo "Missing OS Name."
    echo "Usage:  ./init.sh [os_name]"
    exit 1
fi

OS_CONFIGURE="${DOTFILES_HOME}/install/${OS_NAME}/configure.sh"

if [ ! -e "${OS_CONFIGURE}" ]; then
    echo "OS Name not found: ${OS_NAME}"
    exit 9
fi

echo "Configuring ${OS_NAME}..."
${OS_CONFIGURE}

