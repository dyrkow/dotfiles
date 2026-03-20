#!/usr/bin/env bash
set -e

source "$(dirname "$0")/../../scripts/common.sh"
source "$(dirname "$0")/../../scripts/helper.sh"

MODULE_NAME="yandex-telemost"

install() {
    # Brew cask token is `yandextelemost`
    install_cask "yandextelemost"
}

apply() {
    :
}

run_main "$@"

