#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=telegram
INSTALL_CASK=telegram

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
