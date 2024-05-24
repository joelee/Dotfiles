#!/bin/bash
# Configuration for [Amethyst](https://github.com/ianyh/Amethyst)

if [ "$(uname)" != "Darwin" ]; then
  echo "This script is only for macOS"
  exit 1
fi

if [ ! -d "/Applications/Amethyst.app" ]; then
  echo "Amethyst is not installed"
  exit 1
fi

BASE_PATH="$(dirname $0)"
source "$DOTFILES_HOME/init.sh"

LAYOUT_PATH="${BASE_PATH}/Layouts"
AMETHYST_PATH="${HOME}/Library/Application Support/Amethyst"

# Amethyst 0.21.0 Layouts do not support symlinks. Copy the files instead.
# @todo File a bug report
cp -f "${LAYOUT_PATH}"/*.js "${AMETHYST_PATH}/Layouts"

# backup_file "${AMETHYST_PATH}/Layouts"
# cd "${AMETHYST_PATH}"
# ln -s "${BASEDIR}/Layouts"
# symlink_file "${LAYOUT_PATH}" "${AMETHYST_PATH}/Layouts"
