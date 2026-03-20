#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="anydesk"

install() {
    install_cask "anydesk"
}

apply() {
    :
}

run_main "$@"

