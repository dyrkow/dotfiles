#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$HOME/work/self/dotfiles"
ARCHIVE_URL="https://github.com/dyrkow/dotfiles/archive/refs/heads/master.tar.gz"

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
trap 'rm -f "$SCRIPT_PATH"' EXIT

mkdir -p "$HOME/work/self"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

curl -fsSL "$ARCHIVE_URL" | tar -xz --strip-components=1 -C "$TARGET_DIR"

echo "Repo installed to: $TARGET_DIR"
echo "Now run: cd \"$TARGET_DIR\" && make bootstrap"

