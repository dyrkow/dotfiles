#!/bin/bash

set -e

MODULE_NAME="docker-compose"

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
        setup)
            install_binary || fail
            ;;
        *)
            echo "❌ Unknown command: $cmd" >&2
            echo "Usage: $0 [setup|install]" >&2
            fail
            ;;
    esac

    echo
    print_separator
    echo
}

main "$@"