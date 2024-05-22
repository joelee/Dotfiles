#!/bin/bash
# Starship configuration set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

cfg_dir="${HOME}/.config"

source_cfg_file="${BASE_PATH}/starship.toml"
target_cfg_file="${cfg_dir}/starship.toml"

symlink_file ${source_cfg_file} ${target_cfg_file}
