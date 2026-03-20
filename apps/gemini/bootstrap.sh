#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="gemini"

install() {
    # Gemini is installed as a cask (MacPaw app).
    install_cask "gemini"
}

apply() {
    :
}

run_main "$@"

