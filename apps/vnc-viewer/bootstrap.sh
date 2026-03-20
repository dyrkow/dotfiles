#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="vnc-viewer"

install() {
    install_cask "vnc-viewer"
}

apply() {
    :
}

run_main "$@"

