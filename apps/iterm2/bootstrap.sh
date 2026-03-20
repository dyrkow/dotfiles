#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="iterm2"

install() {
    install_cask "iterm2"
}

apply() {
    :
}

run_main "$@"

