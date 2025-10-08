#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="vimlua"
PACKAGE_NAME="neovim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DST_DIR="$HOME/.config/nvim"

install() {
    # It installs neovim, which is the same as for nvim module
    install_with_brew "nvim" "$PACKAGE_NAME"
}

apply() {
    log_applying_config
    echo "Removing previous nvim configuration..."
    rm -rf "$CONFIG_DST_DIR"
    mkdir -p "$CONFIG_DST_DIR"

    echo "Copying vimlua configuration files..."
    if cp "$SCRIPT_DIR/init.lua" "$CONFIG_DST_DIR/init.lua" && \
       cp -r "$SCRIPT_DIR/lua" "$CONFIG_DST_DIR/lua" && \
       cp -r "$SCRIPT_DIR/colors" "$CONFIG_DST_DIR/colors"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"
