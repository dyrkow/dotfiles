#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=tmux
INSTALL_FORMULA=tmux
APPLY_FILES=(".tmux.conf:$HOME/.tmux.conf")

source "$(dirname "$0")/../../scripts/common.sh"

# Clone TPM repository if it doesn't exist
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  info "Installing TPM (Tmux Plugin Manager)..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

run_module "$@"
