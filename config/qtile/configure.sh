#!/bin/bash
# Alacritty configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../init.sh"

cfg_dir="${HOME}/.config/qtile"
chk_config_dir ${cfg_dir}

symlink_file ${BASE_PATH} ${cfg_dir}
