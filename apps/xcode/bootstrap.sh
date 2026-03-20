#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="xcode"

install() {
    install_mas_id "497799835"
}

apply() {
    :
}

run_main "$@"

