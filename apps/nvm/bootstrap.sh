#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=nvm
INSTALL_FORMULA=nvm

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    install_formula "${INSTALL_FORMULA}"
    mkdir -p "$HOME/.nvm"
}

run_module "$@"
