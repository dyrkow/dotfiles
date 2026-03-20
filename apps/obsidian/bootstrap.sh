#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="obsidian"

install() {
    install_cask "obsidian"
}

apply() {
    :
}

run_main "$@"

