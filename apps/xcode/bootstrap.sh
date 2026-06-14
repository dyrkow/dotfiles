#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=xcode
INSTALL_MAS_ID=497799835

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
