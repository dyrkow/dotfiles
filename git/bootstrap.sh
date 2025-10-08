#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="git"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC_GITCONFIG="$SCRIPT_DIR/.gitconfig"
CONFIG_DST_GITCONFIG="$HOME/.gitconfig"
CONFIG_SRC_GITATTRIBUTES="$SCRIPT_DIR/.gitattributes"
CONFIG_DST_GITATTRIBUTES="$HOME/.gitattributes"

install() {
    install_with_brew
}

apply() {
    log_applying_config
    if cp "$CONFIG_SRC_GITCONFIG" "$CONFIG_DST_GITCONFIG" && cp "$CONFIG_SRC_GITATTRIBUTES" "$CONFIG_DST_GITATTRIBUTES"; then
        echo "✅ applied successfully"
    else
        echo "❌ ERROR: failed to copy config" >&2
        return 1
    fi
}

run_main "$@"
