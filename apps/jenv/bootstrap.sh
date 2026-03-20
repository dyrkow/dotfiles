#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="jenv"

install() {
    install_formula "jenv"
}

apply() {
    :
}

run_main "$@"

