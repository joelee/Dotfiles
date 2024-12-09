#!/bin/bash
# NeoVim set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../common/common_functions.bash"

check_configured nvim

cfg_dir="${HOME}/.config/nvim"
backup_file "${cfg_dir}"
mkdir -p "${cfg_dir}"

init_file="${cfg_dir}/init.lua"

symlink_file "${BASE_PATH}/init.lua" "${cfg_dir}/init.lua"
symlink_file "${BASE_PATH}/lua" "${cfg_dir}/lua"

mark_configured nvim

