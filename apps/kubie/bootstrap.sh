#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=kubie
INSTALL_FORMULA=kubie
APPLY_FILES=("kubie.yaml:$HOME/.kube/kubie.yaml")

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
