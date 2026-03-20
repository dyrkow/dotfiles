#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="spotify"

install() {
    install_cask "spotify"
}

apply() {
    :
}

run_main "$@"

