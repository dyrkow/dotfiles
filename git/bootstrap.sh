#!/bin/bash

set -e

MODULE_NAME="git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC_GITCONFIG="$SCRIPT_DIR/.gitconfig"
CONFIG_DST_GITCONFIG="$HOME/.gitconfig"
CONFIG_SRC_GITATTRIBUTES="$SCRIPT_DIR/.gitattributes"
CONFIG_DST_GITATTRIBUTES="$HOME/.gitattributes"

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

    if brew install "$MODULE_NAME"; then
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

    if cp "$CONFIG_SRC_GITCONFIG" "$CONFIG_DST_GITCONFIG" && cp "$CONFIG_SRC_GITATTRIBUTES" "$CONFIG_DST_GITATTRIBUTES"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
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