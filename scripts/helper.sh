#!/usr/bin/env bash
set -euo pipefail

# Helper library for apps/<program>/bootstrap.sh
# Provides minimal wrappers around brew/mas installation.

HELPER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${HELPER_DIR}/.." && pwd)"

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

