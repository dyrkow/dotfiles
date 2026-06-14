#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=shadowrocket
INSTALL_MAS_ID=932747118

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
