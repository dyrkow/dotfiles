#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=zsh
INSTALL_FORMULA=zsh
APPLY_FILES=(
    ".zshrc:$HOME/.zshrc"
    "prompt.zsh:$HOME/.prompt.zsh"
)

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
