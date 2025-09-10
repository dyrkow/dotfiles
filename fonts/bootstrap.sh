#!/bin/bash

set -e

MODULE_NAME="Fonts"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

install_fonts() {
    log_installing

    if fc-list | grep -q "MesloLGSNerdFontMono"; then
        echo "✅ already installed"
        return 0
    fi

    if cp "$SCRIPT_DIR"/*.ttf "$HOME/Library/Fonts/"; then
        echo "✅ installed successfully"
    else
        echo "❌ ERROR: installation failed" >&2
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
            install_fonts || fail
            ;;
        setup)
            install_fonts || fail
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