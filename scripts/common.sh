#!/bin/bash

# Common utility functions for bootstrap scripts

print_separator() {
    echo "────────────────────────────"
}

log_module_header() {
    echo
    echo "📦 Module: $MODULE_NAME"
    echo
}

log_installing() {
    echo "🚀 Installing..."
}

log_applying_config() {
    echo "🎯 Applying configuration..."
}

fail() {
    echo
    print_separator
    exit 1
}

# Generic installer using Homebrew.
# Usage: install_with_brew [binary_name] [package_name] [cask_install:true|false]
# - binary_name: The name of the binary to check for. Defaults to $MODULE_NAME.
# - package_name: The name of the brew package to install. Defaults to binary_name.
# - cask_install: Set to "true" for cask installations. Defaults to "false".
install_with_brew() {
    local binary_name="${1:-$MODULE_NAME}"
    local package_name="${2:-$binary_name}"
    local cask_install="${3:-false}"

    log_installing

    if command -v "$binary_name" &> /dev/null; then
        echo "✅ already installed"
        return 0
    fi

    local install_cmd="brew install"
    if [ "$cask_install" = "true" ]; then
        install_cmd="brew install --cask"
    fi

    if $install_cmd "$package_name"; then
        if command -v "$binary_name" &> /dev/null; then
            echo "✅ installed successfully"
        else
            echo "❌ ERROR: installation failed (binary not found after install)" >&2
            return 1
        fi
    else
        echo "❌ ERROR: installation script failed" >&2
        return 1
    fi
}

# Main command runner
run_main() {
    local cmd="${1:-setup}"
    local usage="Usage: $0"
    local available_commands="setup"

    if declare -F install &> /dev/null; then
        available_commands="$available_commands|install"
    fi
    if declare -F apply &> /dev/null; then
        available_commands="$available_commands|apply"
    fi
    usage="$usage [$available_commands]"


    echo
    print_separator
    log_module_header

    case "$cmd" in
        install)
            if declare -F install &> /dev/null; then
                install || fail
            else
                echo "❌ 'install' command is not available for this module." >&2
                echo "$usage" >&2
                fail
            fi
            ;;
        apply)
            if declare -F apply &> /dev/null; then
                apply || fail
            else
                echo "❌ 'apply' command is not available for this module." >&2
                echo "$usage" >&2
                fail
            fi
            ;;
        setup)
            if declare -F install &> /dev/null; then
                install || fail
            fi
            if declare -F apply &> /dev/null; then
                echo
                apply || fail
            fi
            ;;
        *)
            echo "❌ Unknown command: $cmd" >&2
            echo "$usage" >&2
            fail
            ;;
    esac

    echo
    print_separator
    echo
}
