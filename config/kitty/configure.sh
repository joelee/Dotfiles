#!/bin/bash
# Fish shell configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"

cfg_dir="${HOME}/.config/kitty"

source_cfg_file="${BASE_PATH}/kitty.conf"
target_cfg_file="${cfg_dir}/kitty.conf"
symlink_file ${source_cfg_file} ${target_cfg_file}

source_cfg_file="${BASE_PATH}/mocha.conf"
target_cfg_file="${cfg_dir}/mocha.conf"
symlink_file ${source_cfg_file} ${target_cfg_file}
