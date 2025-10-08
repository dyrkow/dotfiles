#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="brew"

install() {
    log_installing

    if command -v "$MODULE_NAME" &> /dev/null; then
        echo "✅ already installed"
        return 0
    fi

    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
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

run_main "$@"
