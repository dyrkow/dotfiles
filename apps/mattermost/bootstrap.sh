#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=mattermost
INSTALL_CASK=mattermost

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
