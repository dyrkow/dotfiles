#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="docker"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC_CONFIG="$SCRIPT_DIR/config.json"
CONFIG_SRC_DAEMON="$SCRIPT_DIR/daemon.json"
CONFIG_DST_DIR="$HOME/.docker"

install() {
    install_with_brew "docker" "docker" "true"
}

apply() {
    log_applying_config
    mkdir -p "$CONFIG_DST_DIR"
    if cp "$CONFIG_SRC_CONFIG" "$CONFIG_DST_DIR/" && cp "$CONFIG_SRC_DAEMON" "$CONFIG_DST_DIR/"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"
