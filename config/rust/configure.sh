#!/bin/bash
# Rust configuration set up

BASE_PATH="$(dirname $0)"
source "$BASE_PATH/../../common/common_functions.bash"

check_configured rust

RUSTUP="$(which rustup)"

if [ -z "${RUSTUP}" ]; then
    echo "RustUp was not installed."
    exit 1
fi

echo "Downloading the latest stable release of Rust and set it as default toolchain..."
${RUSTUP} default stable

RUSTUP_BIN="$(dirname $(rustup which rustc))"
LINK_PATH="${HOME}/.rustup/bin"
symlink_file "${RUSTUP_BIN}" "${LINK_PATH}"
export PATH="${LINK_PATH}:${PATH}"

cargo -V
rustc -V

rustup component add rust-src
rustup component add rust-analyzer
rustup component add rustfmt
rustup component add clippy

mark_configured rust
