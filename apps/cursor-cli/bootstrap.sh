#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=cursor-cli
INSTALL_CASK=cursor-cli

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
