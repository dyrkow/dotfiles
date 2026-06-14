#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=gemini
INSTALL_CASK=gemini

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
