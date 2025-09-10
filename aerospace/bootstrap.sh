#!/bin/bash

set -e

MODULE_NAME="aerospace"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_SRC="$SCRIPT_DIR/aerospace.toml"
CONFIG_DST="$HOME"

print_separator() {
    echo "────────────────────────────"
}

log_module_header() {
    echo
    echo "📦 Module: $MODULE_NAME"
    echo
}

log_installing() {
    echo "🚀 Installing..."
}

log_applying_config() {
    echo "🎯 Applying configuration..."
}

install_binary() {
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

apply_config() {
    log_applying_config

    if cp "$CONFIG_SRC" "$CONFIG_DST" 2>/dev/null; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config from $CONFIG_SRC to $CONFIG_DST" >&2
        return 1
    fi
}

fail() {
    echo
    print_separator
    exit 1
}

main() {
    local cmd="${1:-setup}"

    echo
    print_separator
    log_module_header

    case "$cmd" in
        install)
            install_binary || fail
            ;;
        apply)
            apply_config || fail
            ;;
        setup)
            install_binary || fail
            echo
            apply_config || fail
            ;;
        *)
            echo "❌ Unknown command: $cmd" >&2
            echo "Usage: $0 [setup|install|apply]" >&2
            fail
            ;;
    esac

    echo
    print_separator
    echo
}

main "$@"
