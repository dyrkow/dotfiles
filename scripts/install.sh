#!/usr/bin/env bash
set -euo pipefail

# --- Configuration ---
TARGET_DIR="$HOME/Work/Self/dotfiles"
REPO_URL="https://github.com/dyrkow/dotfiles.git"

# --- Helper Functions ---
print_separator() {
    printf -- '-%.0s' {1..80}; echo
}
log_header() {
    echo; print_separator; echo "➡️  $1"; print_separator
}

# --- Main Logic ---

# Function to install Homebrew
install_homebrew() {
    log_header "Checking for Homebrew..."
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew is already installed."
        return
    fi
    echo "Installing Homebrew..."
    if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo "ERROR: Homebrew installation failed." >&2; exit 1
    fi

    # Add Homebrew to PATH for this script's execution
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    else
        echo "ERROR: brew binary not found after installation." >&2; exit 1
    fi
}

# Function to install Git using Homebrew
install_git() {
    log_header "Checking for Git..."
    if command -v git >/dev/null 2>&1; then
        echo "Git is already installed."
        return
    fi
    echo "Installing Git with Homebrew..."
    if ! brew install git; then
        echo "ERROR: Git installation failed." >&2; exit 1
    fi
}

# Function to clone the dotfiles repository
clone_repo() {
    log_header "Cloning dotfiles repository..."
    if [[ -d "$TARGET_DIR" ]]; then
        echo "Directory $TARGET_DIR already exists. It will be removed to re-clone."
        rm -rf "$TARGET_DIR"
    fi
    echo "Cloning $REPO_URL to $TARGET_DIR..."
    if ! git clone --branch master "$REPO_URL" "$TARGET_DIR"; then
        echo "ERROR: Failed to clone repository." >&2; exit 1
    fi
}

# --- Execution ---
main() {
    install_homebrew
    install_git
    clone_repo

    echo; print_separator
    echo "✅ Initial setup complete!"
    echo
    echo "Next steps:"
    echo "1. Change directory: cd \"$TARGET_DIR\""
    echo "2. Run bootstrap:   make bootstrap"
    print_separator
}

main