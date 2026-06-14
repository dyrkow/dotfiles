#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=spotify
INSTALL_CASK=spotify

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
