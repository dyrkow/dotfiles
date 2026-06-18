#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=iterm2
INSTALL_CASK=iterm2
APPLY_FILES=(
    "com.googlecode.iterm2.plist:$HOME/Library/Preferences/com.googlecode.iterm2.plist"
)

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
