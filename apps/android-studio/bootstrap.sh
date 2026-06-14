#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=android-studio
INSTALL_CASK=android-studio

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
