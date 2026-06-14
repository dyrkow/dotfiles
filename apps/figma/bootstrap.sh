#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=figma
INSTALL_CASK=figma

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
