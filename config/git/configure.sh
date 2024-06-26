#!/bin/bash
# GIT configuration set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

# source "${DOTFILES_PATH}/install/common/common_functions.bash"

if [ -z "$(which git)" ]; then
    echo "Git is not installed."
    exit 1
fi

git_config="$HOME/.gitconfig"
git_ignore="$HOME/.gitignore"

echo "Configuring ${git_config} ..."

copy_file "${BASE_PATH}/gitconfig" "${git_config}"
copy_file "${BASE_PATH}/gitignore" "${git_ignore}"

if [ -n "${USER_NAME}" ]; then
    echo "  Setting up user name: ${USER_NAME}"
    git config --global user.name "${USER_NAME}"
fi

if [ -n "${USER_EMAIL}" ]; then
    echo "  Setting up user email: ${USER_EMAIL}"
    git config --global user.email "${USER_EMAIL}"
fi

git config --global core.excludesfile "${git_ignore}"

echo "${git_config} configured!"
echo " "
