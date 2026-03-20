#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="tmux"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    install_formula "tmux"
}

apply() {
    log_applying_config
    local config_src="$SCRIPT_DIR/.tmux.conf"
    local config_dst="$HOME/.tmux.conf"
    if cp "$config_src" "$config_dst"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"

