#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=ansible
INSTALL_FORMULA=ansible

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
