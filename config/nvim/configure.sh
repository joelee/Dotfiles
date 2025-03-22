#!/bin/bash
# NeoVim and LazyVim set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

if [ -e "${DOTFILES_LOCAL_PATH}/nvim" ]; then
    echo "kickstarter.nvim has been installed. To reinstall remove ${DOTFILES_LOCAL_PATH}/nvim"
    exit 0
fi

cfg_dir="${HOME}/.config/nvim"
backup_file "${cfg_dir}"

git clone https://github.com/joelee/kickstart.nvim "${cfg_dir}"

touch "${DOTFILES_LOCAL_PATH}/nvim"
