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
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nikitabobko/aerospace/main/install.sh)"; then
        if command -v "${MODULE_NAME}" >/dev/null 2>&1; then
            echo "✅ installed ${MODULE_NAME}"
        else
            echo "❌ ERROR: installation failed (binary not found after install)" >&2
            return 1
        fi
    else
        echo "❌ ERROR: installation script failed" >&2
        return 1
    fi
}

run_module "$@"
