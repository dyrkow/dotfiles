#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="telegram"

install() {
    install_cask "telegram"
}

apply() {
    :
}

run_main "$@"

