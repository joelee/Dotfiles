#!/bin/bash
# GIT configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"
if [ -z "${DOTFILES_PATH}" ]; then
    echo "DOTFILES_PATH was not defined. Run 'init.sh' from the Dotfiles directory first."
    exit 1
fi


# source "${DOTFILES_PATH}/install/common/common_functions.bash"

if [ -z "$(which git)" ]; then
    echo "Git is not installed."
    exit 1
fi

echo "0: ${BASE_PATH}"
echo "1: ${DOTFILES_PATH}"
echo "2: ${DOTFILES_LOCAL_PATH}"
echo "U1: ${USER_NAME}"
echo "U2: ${USER_EMAIL}"


dotfiles_test 123

# cat "$BASE_PATH/gitconfig"

exit 0

git_config="$HOME/.gitconfig"
git_ignore="$HOME/.gitignore"

echo "Configuring ${git_config} ..."

backup_file "${git_config}"
cp -f "${BASE_PATH}/gitconfig" "${git_config}"

backup_file "${git_ignore}"
cp -f "${BASE_PATH}/gitignore" "${git_ignore}"

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
