#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="fonts"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    # Non-brew install: copy Nerd Font TTFs.
    log_installing

    # Keeping original behaviour: only install if font isn't present.
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

apply() {
    :
}

run_main "$@"

