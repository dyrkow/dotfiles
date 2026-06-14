#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=iterm2
INSTALL_CASK=iterm2

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
