#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=postman
INSTALL_CASK=postman

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
