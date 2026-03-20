#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="vimlua"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    # vimlua module installs neovim; it keeps config in apply().
    install_formula "neovim"
}

apply() {
    log_applying_config
    local config_dst_dir="$HOME/.config/nvim"

    echo "Removing previous nvim configuration..."
    rm -rf "$config_dst_dir"
    mkdir -p "$config_dst_dir"

    echo "Copying vimlua configuration files..."
    if cp "$SCRIPT_DIR/init.lua" "$config_dst_dir/init.lua" && \
       cp -r "$SCRIPT_DIR/lua" "$config_dst_dir/lua" && \
       cp -r "$SCRIPT_DIR/colors" "$config_dst_dir/colors"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"

