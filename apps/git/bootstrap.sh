#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=git
INSTALL_FORMULA=git
APPLY_FILES=(
    ".gitconfig:$HOME/.gitconfig"
    ".gitattributes:$HOME/.gitattributes"
)

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
