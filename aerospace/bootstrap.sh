#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="aerospace"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/.aerospace.toml"
CONFIG_DST="$HOME/.aerospace.toml"

install() {
    log_installing

    if command -v "$MODULE_NAME" &> /dev/null; then
        echo "✅ already installed"
        return 0
    fi

    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nikitabobko/aerospace/main/install.sh)"; then
        if command -v "$MODULE_NAME" &> /dev/null; then
            echo "✅ installed successfully"
        else
            echo "❌ ERROR: installation failed (binary not found after install)" >&2
            return 1
        fi
    else
        echo "❌ ERROR: installation script failed" >&2
        return 1
    fi
}

apply() {
    log_applying_config
    if cp "$CONFIG_SRC" "$CONFIG_DST"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"