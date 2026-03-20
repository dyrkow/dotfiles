#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="google-chrome"

install() {
    install_cask "google-chrome"
}

apply() {
    :
}

run_main "$@"

