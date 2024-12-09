#!/bin/bash
# Alacritty configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../common/common_functions.bash"

check_configured alacritty

source_cfg_file="${BASE_PATH}/alacritty.toml"
target_cfg_file="${HOME}/.config/alacritty/alacritty.toml"
symlink_file ${source_cfg_file} ${target_cfg_file}

mark_configured alacritty

