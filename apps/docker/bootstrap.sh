#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="docker"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    install_cask "docker"
}

apply() {
    log_applying_config
    local config_src_config="$SCRIPT_DIR/config.json"
    local config_src_daemon="$SCRIPT_DIR/daemon.json"
    local config_dst_dir="$HOME/.docker"
    mkdir -p "$config_dst_dir"
    if cp "$config_src_config" "$config_dst_dir/" && cp "$config_src_daemon" "$config_dst_dir/"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"

