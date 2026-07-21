#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=claude-code

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    log_installing
    # Предполагаем, что приложение устанавливается в /Applications/Claude Code.app
    if skip_if_path_exists "/Applications/Claude Code.app"; then
        return 0
    fi

    if brew install --cask claude-code; then
        echo "✅ installed ${MODULE_NAME}"
    else
        echo "❌ ERROR: installation failed" >&2
        return 1
    fi
}

run_module "$@"
