#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=vnc-viewer
INSTALL_CASK=vnc-viewer

source "$(dirname "$0")/../../scripts/common.sh"

# Переопределяем общую функцию install, чтобы временно отключить этот модуль.
install() {
    log_installing

    # Команда brew закомментирована из-за ошибки загрузки 
    # (по состоянию на 21.07.2026).
    # Ошибка: "Download failed on Cask 'vnc-viewer'"
    #
    # if brew install --cask vnc-viewer; then
    #     echo "✅ installed ${MODULE_NAME}"
    # else
    #     echo "❌ ERROR: installation failed" >&2
    #     return 1
    # fi

    echo "⚠️ ${MODULE_NAME} не установлен. Пожалуйста, установите его вручную с https://www.realvnc.com/en/connect/download/viewer/"
    echo "   Автоматическая установка временно отключена из-за ошибки загрузки в Homebrew."
    
    # Возвращаем 0, чтобы не блокировать основной скрипт установки.
    return 0
}

run_module "$@"