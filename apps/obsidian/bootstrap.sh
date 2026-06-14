#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=obsidian
INSTALL_CASK=obsidian

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
