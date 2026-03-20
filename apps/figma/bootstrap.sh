#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="figma"

install() {
    install_cask "figma"
}

apply() {
    :
}

run_main "$@"

