#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="android-studio"

install() {
    install_cask "android-studio"
}

apply() {
    :
}

run_main "$@"

