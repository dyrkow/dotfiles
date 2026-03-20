#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="git"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    install_formula "git"
}

apply() {
    log_applying_config
    local config_src_gitconfig="$SCRIPT_DIR/.gitconfig"
    local config_src_gitattributes="$SCRIPT_DIR/.gitattributes"
    local config_dst_gitconfig="$HOME/.gitconfig"
    local config_dst_gitattributes="$HOME/.gitattributes"
    if cp "$config_src_gitconfig" "$config_dst_gitconfig" && cp "$config_src_gitattributes" "$config_dst_gitattributes"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"

