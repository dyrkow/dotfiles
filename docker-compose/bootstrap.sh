#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="docker-compose"

install() {
    install_with_brew
}

run_main "$@"
