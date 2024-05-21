#!/bin/bash
# Alacritty configuration set up

BASE_PATH="$(dirname $0)"
if [ -z "${DOTFILES_PATH}" ]; then
    echo "DOTFILES_PATH was not defined. Run 'init.sh' from the Dotfiles directory first."
    exit 1
fi

source "${DOTFILES_PATH}/install/common/common_functions.bash"

source_cfg_file="${BASE_PATH}/alacritty.toml"
target_cfg_file="${HOME}/.config/alacritty/alacritty.toml"

backup_file "${target_cfg_file}"

echo "  Symlinking ${source_cfg_file} => ${target_cfg_file} ..."
ln -s "${source_cfg_file}" "${target_cfg_file}"
