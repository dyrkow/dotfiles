#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="fliqlo"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    # Non-brew install: download & place Screen Saver.
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

apply() {
    :
}

run_main "$@"

