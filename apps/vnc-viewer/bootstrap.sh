#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=vnc-viewer
INSTALL_CASK=vnc-viewer

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
