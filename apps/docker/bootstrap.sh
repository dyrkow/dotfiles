#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=docker
INSTALL_CASK=docker
APPLY_FILES=(
    "config.json:$HOME/.docker/config.json"
    "daemon.json:$HOME/.docker/daemon.json"
)

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
