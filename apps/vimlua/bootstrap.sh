#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=vimlua
INSTALL_FORMULA=neovim
APPLY_DIR="$HOME/.config/nvim"
APPLY_TREE=(init.lua lua colors)

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
