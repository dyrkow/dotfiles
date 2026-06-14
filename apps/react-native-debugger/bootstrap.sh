#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=react-native-debugger
INSTALL_CASK=react-native-debugger

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
