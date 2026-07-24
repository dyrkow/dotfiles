#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=tmuxinator
INSTALL_FORMULA=tmuxinator
APPLY_FILES=("config:$HOME/.config/tmuxinator")

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"