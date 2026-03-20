#!/usr/bin/env bash
set -e

# This module exports/imports macOS keyboard shortcuts from the user preferences database.
#
# It uses:
# - file: `~/Library/Preferences/com.apple.symbolichotkeys.plist`
# - domain: `com.apple.symbolichotkeys`

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="macos-keyboard-shortcuts"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install() {
    # Hotkeys are macOS user preferences; no external install step needed.
    :
}

apply() {
    log_applying_config

    local plist_src="$SCRIPT_DIR/com.apple.symbolichotkeys.plist"
    if [[ ! -f "$plist_src" ]]; then
        echo "❌ Missing exported plist: $plist_src" >&2
        echo "Export it on the old Mac and commit it into this repo." >&2
        return 1
    fi

    # Import keyboard shortcuts into current user's preferences.
    # This replaces the current settings in the same preferences domain.
    defaults import com.apple.symbolichotkeys "$plist_src"

    # Refresh caches so changes show up in System Settings immediately.
    killall cfprefsd 2>/dev/null || true
    killall SystemUIServer 2>/dev/null || true

    echo "✅ applied successfully"
}

run_main "$@"
