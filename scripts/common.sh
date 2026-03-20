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

# Homebrew/mas helper functions (moved here from helper.sh)
ensure_brew() {
    if command -v brew >/dev/null 2>&1; then
        return 0
    fi

    # Inline Homebrew installation (no dependency on external installers).
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        :
    else
        echo "ERROR: Homebrew installation failed" >&2
        exit 1
    fi

    # Make brew available in PATH for the current process.
    if [[ -x /opt/homebrew/bin/brew ]]; then
        export PATH="/opt/homebrew/bin:${PATH}"
    elif [[ -x /usr/local/bin/brew ]]; then
        export PATH="/usr/local/bin:${PATH}"
    else
        echo "ERROR: brew binary not found after installation" >&2
        exit 1
    fi
}

install_formula() {
    local formula="$1"
    ensure_brew
    brew install "${formula}"
}

install_cask() {
    local cask="$1"
    ensure_brew
    brew install --cask "${cask}"
}

ensure_mas() {
    ensure_brew
    if command -v mas >/dev/null 2>&1; then
        return 0
    fi
    brew install mas
}

install_mas_id() {
    local id="$1"
    ensure_mas
    mas install "${id}"
}
