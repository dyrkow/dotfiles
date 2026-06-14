#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=fliqlo

source "$(dirname "$0")/../../scripts/common.sh"

install() {
    log_installing
    if skip_if_path_exists "$HOME/Library/Screen Savers/Fliqlo.saver"; then
        return 0
    fi

    local fliqlo_url="https://fliqlo.com/download/fliqlo_185.zip"
    local temp_dir
    temp_dir=$(mktemp -d)

    echo "Downloading Fliqlo..."
    if ! curl -L "$fliqlo_url" -o "$temp_dir/fliqlo.zip"; then
        echo "❌ ERROR: download failed" >&2
        rm -rf "$temp_dir"
        return 1
    fi

    echo "Unzipping Fliqlo..."
    if ! unzip "$temp_dir/fliqlo.zip" -d "$temp_dir"; then
        echo "❌ ERROR: unzip failed" >&2
        rm -rf "$temp_dir"
        return 1
    fi

    echo "Installing Fliqlo..."
    if ! mv "$temp_dir/Fliqlo.saver" "$HOME/Library/Screen Savers/"; then
        echo "❌ ERROR: installation failed" >&2
        rm -rf "$temp_dir"
        return 1
    fi

    rm -rf "$temp_dir"
    echo "✅ installed ${MODULE_NAME}"
}

run_module "$@"
