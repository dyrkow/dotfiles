#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=nvim
INSTALL_FORMULA=neovim
APPLY_DIR="$HOME/.config/nvim"
APPLY_FILES=(
    "init.vim:$HOME/.config/nvim/init.vim"
    "coc-settings.json:$HOME/.config/nvim/coc-settings.json"
)

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
