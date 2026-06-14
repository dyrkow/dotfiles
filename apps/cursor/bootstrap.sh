#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=cursor
INSTALL_CASK=cursor

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
