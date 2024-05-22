#!/bin/bash
# Tmux configuration set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

cfg_dir="${HOME}/.config/tmux"

source_cfg_file="${BASE_PATH}/tmux.conf"
target_cfg_file="${cfg_dir}/tmux.conf"

symlink_file ${source_cfg_file} ${target_cfg_file}
