#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="Fonts"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
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

run_main "$@"
