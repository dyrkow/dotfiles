#!/bin/bash
set -e

source "$(dirname "$0")/../scripts/common.sh"

MODULE_NAME="gemini"

install() {
    install_with_brew
}

run_main "$@"
