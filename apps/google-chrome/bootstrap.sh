#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=google-chrome
INSTALL_CASK=google-chrome

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
