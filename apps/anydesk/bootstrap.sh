#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=anydesk
INSTALL_CASK=anydesk

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
