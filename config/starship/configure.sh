#!/bin/bash
# Starship configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"

cfg_dir="${HOME}/.config"
chk_config_dir ${cfg_dir}

source_cfg_file="${BASE_PATH}/starship.toml"
target_cfg_file="${cfg_dir}/starship.toml"

symlink_file ${source_cfg_file} ${target_cfg_file}
