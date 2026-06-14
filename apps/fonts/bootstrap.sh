#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=fonts

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    log_installing
    if command -v fc-list >/dev/null 2>&1 && fc-list | grep -q "MesloLGSNerdFontMono"; then
        log_skip
        return 0
    fi
    if cp "${SCRIPT_DIR}"/*.ttf "$HOME/Library/Fonts/"; then
        echo "✅ installed ${MODULE_NAME}"
    else
        echo "❌ ERROR: installation failed" >&2
        return 1
    fi
}

run_module "$@"
