#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=vimlua
INSTALL_FORMULA=neovim
APPLY_DIR="$HOME/.config/nvim"
APPLY_TREE=(init.lua lua colors)

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    install_formula "${INSTALL_FORMULA}"
    install_formula "tree-sitter-cli"
}

run_module "$@"
