#!/bin/bash
# Fish shell configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../common/common_functions.bash"

check_configured fish

cfg_dir="${HOME}/.config/fish"

if [ ! -e "${BASE_PATH}/config.fish" ]; then
    source_cfg_file="${BASE_PATH}/config.fish"
    target_cfg_file="${cfg_dir}/config.fish"
    symlink_file ${source_cfg_file} ${target_cfg_file}
fi

source_cfg_dir="${BASE_PATH}/conf.d"
target_cfg_dir="${cfg_dir}/conf.d"
symlink_file ${source_cfg_dir} ${target_cfg_dir}

if [ ! -e "${HOME}/.local/bin" ]; then
    mkdir -p "${HOME}/.local/bin"
fi

mark_configured fish
