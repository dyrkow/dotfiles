#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="react-native-debugger"

install() {
    install_cask "react-native-debugger"
}

apply() {
    :
}

run_main "$@"

