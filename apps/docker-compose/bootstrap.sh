#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="docker-compose"

install() {
    install_formula "docker-compose"
}

apply() {
    :
}

run_main "$@"

