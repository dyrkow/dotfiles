#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="nvim"
PACKAGE_NAME="neovim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/init.vim"
CONFIG_DST_DIR="$HOME/.config/nvim"
CONFIG_DST_FILE="$CONFIG_DST_DIR/init.vim"

install() {
    install_with_brew "$MODULE_NAME" "$PACKAGE_NAME"
}

apply() {
    log_applying_config
    mkdir -p "$CONFIG_DST_DIR"
    if cp "$CONFIG_SRC" "$CONFIG_DST_FILE" && cp "$SCRIPT_DIR/coc-settings.json" "$CONFIG_DST_DIR/"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"