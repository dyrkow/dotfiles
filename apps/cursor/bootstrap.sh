#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="cursor"

install() {
    install_cask "cursor"
}

apply() {
    :
}

run_main "$@"

