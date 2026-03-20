#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${HOME}/work/self/dotfiles"
REPO_ARCHIVE_URL="${REPO_ARCHIVE_URL:-https://github.com/<owner>/<repo>/archive/refs/heads/main.tar.gz}"

mkdir -p "$(dirname "$TARGET_DIR")"

tmp="$(mktemp -d)"
cleanup() { rm -rf "$tmp"; }
trap cleanup EXIT

curl -fsSL "$REPO_ARCHIVE_URL" -o "$tmp/repo.tgz"
tar -xzf "$tmp/repo.tgz" -C "$tmp"

src_dir="$(find "$tmp" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
if [[ -z "${src_dir:-}" ]]; then
  echo "ERROR: failed to locate extracted repo directory" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

if command -v rsync >/dev/null 2>&1; then
  rsync -a --delete "$src_dir"/ "$TARGET_DIR"/
else
  rm -rf "$TARGET_DIR"
  mkdir -p "$TARGET_DIR"
  cp -R "$src_dir"/. "$TARGET_DIR"/
fi

cd "$TARGET_DIR"
exec make bootstrap
