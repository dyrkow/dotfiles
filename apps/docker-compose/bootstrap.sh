#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=docker-compose
INSTALL_FORMULA=docker-compose

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
