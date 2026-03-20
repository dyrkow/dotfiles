#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="brew"

install() {
    ensure_brew
}

apply() {
    :
}

run_main "$@"

