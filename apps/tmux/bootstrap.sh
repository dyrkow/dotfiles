#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=tmux
INSTALL_FORMULA=tmux
APPLY_FILES=(".tmux.conf:$HOME/.tmux.conf" "themes:$HOME/.tmux/themes")

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    # Install tmux using homebrew
    install_formula "${INSTALL_FORMULA}"

    # Install TPM
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        echo "Installing TPM (Tmux Plugin Manager)..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
}

run_module "$@"