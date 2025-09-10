#!/bin/bash

set -e

MODULE_NAME="Fliqlo"

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

install_screensaver() {
    log_installing

    if [ -e "$HOME/Library/Screen Savers/Fliqlo.saver" ]; then
        echo "✅ already installed"
        return 0
    fi

    FLIQLO_URL="https://fliqlo.com/download/fliqlo_185.zip"
    TEMP_DIR=$(mktemp -d)

    echo "Downloading Fliqlo..."
    if ! curl -L "$FLIQLO_URL" -o "$TEMP_DIR/fliqlo.zip"; then
        echo "❌ ERROR: download failed" >&2
        rm -rf "$TEMP_DIR"
        return 1
    fi

    echo "Unzipping Fliqlo..."
    if ! unzip "$TEMP_DIR/fliqlo.zip" -d "$TEMP_DIR"; then
        echo "❌ ERROR: unzip failed" >&2
        rm -rf "$TEMP_DIR"
        return 1
    fi

    echo "Installing Fliqlo..."
    if ! mv "$TEMP_DIR/Fliqlo.saver" "$HOME/Library/Screen Savers/"; then
        echo "❌ ERROR: installation failed" >&2
        rm -rf "$TEMP_DIR"
        return 1
    fi

    rm -rf "$TEMP_DIR"
    echo "✅ installed successfully"
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
            install_screensaver || fail
            ;;
        setup)
            install_screensaver || fail
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