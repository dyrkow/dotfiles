#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=k9s
INSTALL_FORMULA=k9s

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
