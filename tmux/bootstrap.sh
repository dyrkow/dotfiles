#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="tmux"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="$SCRIPT_DIR/.tmux.conf"
CONFIG_DST="$HOME/.tmux.conf"

install() {
    install_with_brew
}

apply() {
    log_applying_config
    if cp "$CONFIG_SRC" "$CONFIG_DST"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"
