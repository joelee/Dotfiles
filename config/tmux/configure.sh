#!/bin/bash
# Tmux configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"

cfg_dir="${HOME}/.config/fish"
chk_config_dir ${cfg_dir}

source_cfg_file="${BASE_PATH}/tmux.conf"
target_cfg_file="${cfg_dir}/tmux.conf"

symlink_file ${source_cfg_file} ${target_cfg_file}
