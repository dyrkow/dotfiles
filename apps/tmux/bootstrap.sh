#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=tmux
INSTALL_FORMULA=tmux
APPLY_FILES=(".tmux.conf:$HOME/.tmux.conf")

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
