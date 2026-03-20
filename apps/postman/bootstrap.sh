#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="postman"

install() {
    install_cask "postman"
}

apply() {
    :
}

run_main "$@"

