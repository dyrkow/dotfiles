#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="nvim"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    install_formula "neovim"
}

apply() {
    log_applying_config
    local config_src="$SCRIPT_DIR/init.vim"
    local config_dst_dir="$HOME/.config/nvim"
    local config_dst_file="$config_dst_dir/init.vim"

    echo "Removing previous nvim configuration..."
    rm -rf "$config_dst_dir"
    mkdir -p "$config_dst_dir"

    if cp "$config_src" "$config_dst_file" && cp "$SCRIPT_DIR/coc-settings.json" "$config_dst_dir/"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"

