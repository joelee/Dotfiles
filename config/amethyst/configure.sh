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
source "$BASE_PATH/../../common/common_functions.bash"

check_configured amethyst

LAYOUT_PATH="${BASE_PATH}/Layouts"
AMETHYST_PATH="${HOME}/Library/Application Support/Amethyst"
chk_config_dir "${AMETHYST_PATH}/Layouts/"

# Amethyst 0.21.0 Layouts do not support symlinks. Copy the files instead.
# @todo File a bug report
copy_file ${LAYOUT_PATH}/*.js "${AMETHYST_PATH}/Layouts/"
copy_file "${BASE_PATH}/amethyst.yml" "${HOME}/.amethyst.yml"

mark_configured amethyst
