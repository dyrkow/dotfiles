#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=awscli
INSTALL_FORMULA=awscli

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
