#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=aerospace
APPLY_FILES=(".aerospace.toml:$HOME/.aerospace.toml")

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    log_installing
    if skip_if_command_exists "${MODULE_NAME}"; then
        return 0
    fi

    if brew install --cask nikitabobko/tap/aerospace; then
        echo "✅ installed ${MODULE_NAME}"
    else
        echo "❌ ERROR: installation failed" >&2
        return 1
    fi
}

run_module "$@"
