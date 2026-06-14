#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=yandex-telemost
INSTALL_CASK=yandextelemost

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
