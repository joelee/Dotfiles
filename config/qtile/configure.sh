#!/bin/bash
# Alacritty configuration set up

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

cfg_dir="${HOME}/.config/qtile"

symlink_file ${BASE_PATH} ${cfg_dir}
