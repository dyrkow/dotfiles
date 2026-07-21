#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=fliqlo

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    log_installing
    if skip_if_path_exists "$HOME/Library/Screen Savers/Fliqlo.saver"; then
        return 0
    fi

    if brew install --cask fliqlo; then
        echo "✅ installed ${MODULE_NAME}"
    else
        echo "❌ ERROR: installation failed" >&2
        return 1
    fi
}

run_module "$@"
