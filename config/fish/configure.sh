#!/bin/bash
# Fish shell configuration set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

cfg_dir="${HOME}/.config/fish"

source_cfg_file="${BASE_PATH}/config.fish"
target_cfg_file="${cfg_dir}/config.fish"
symlink_file ${source_cfg_file} ${target_cfg_file}

source_cfg_dir="${BASE_PATH}/conf.d"
target_cfg_dir="${cfg_dir}/conf.d"
symlink_file ${source_cfg_dir} ${target_cfg_dir}
