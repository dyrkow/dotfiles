#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=fliqlo

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    log_installing
    if skip_if_path_exists "$HOME/Library/Screen Savers/Fliqlo.saver"; then
        return 0
    fi

    # Команда brew закомментирована, так как официальный "рецепт" в Homebrew
    # имеет несовпадение контрольной суммы для Fliqlo (по состоянию на 21.07.2026).
    # Ошибка: "Cask reports different checksum".
    #
    # if brew install --cask fliqlo; then
    #     echo "✅ installed ${MODULE_NAME}"
    # else
    #     echo "❌ ERROR: installation failed" >&2
    #     return 1
    # fi

    echo "⚠️ ${MODULE_NAME} не установлен. Пожалуйста, установите его вручную с https://fliqlo.com/"
    echo "   Автоматическая установка временно отключена из-за ошибки контрольной суммы в Homebrew."

    # Возвращаем 0, чтобы не блокировать основной скрипт установки.
    return 0
}

run_module "$@"
