#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=mongodb-database-tools
INSTALL_FORMULA=mongodb/brew/mongodb-database-tools

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
