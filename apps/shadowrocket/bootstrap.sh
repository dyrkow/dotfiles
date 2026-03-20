#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="shadowrocket"

install() {
    install_mas_id "932747118"
}

apply() {
    :
}

run_main "$@"

