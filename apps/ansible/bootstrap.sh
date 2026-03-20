#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="ansible"

install() {
    install_formula "ansible"
}

apply() {
    :
}

run_main "$@"

