#!/bin/bash
# Alacritty configuration set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

source_cfg_file="${BASE_PATH}/alacritty.toml"
target_cfg_file="${HOME}/.config/alacritty/alacritty.toml"
symlink_file ${source_cfg_file} ${target_cfg_file}
