#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=jenv
INSTALL_FORMULA=jenv

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
