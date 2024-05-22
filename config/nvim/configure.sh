#!/bin/bash
# NeoVim and LazyVim set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"

if [ -e "${DOTFILES_LOCAL_PATH}/lazyvim" ]; then
    echo "LazyVim has been installed. To reinstall remove ${DOTFILES_LOCAL_PATH}/lazyvim"
    exit 0
fi

cfg_dir="${HOME}/.config/nvim"
backup_file "${cfg_dir}"

git clone https://github.com/LazyVim/starter "${cfg_dir}"
rm -rf "${cfg_dir}/.git"

init_file="${cfg_dir}/init.lua"
echo "" >> "${init_file}"
echo "-- User custom configuration" >> "${init_file}"
echo "vim.g.loaded_perl_provider = 0" >> "${init_file}"

touch "${DOTFILES_LOCAL_PATH}/lazyvim"
