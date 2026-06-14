#!/usr/bin/env bash
set -euo pipefail

# This module configures selected macOS symbolic hotkeys directly in user prefs.
# Domain: com.apple.symbolichotkeys
# File: ~/Library/Preferences/com.apple.symbolichotkeys.plist
#
# Add new shortcuts by appending one row to HOTKEYS:
#   "<id>|<enabled>|<p0>|<p1>|<p2>|<description>"
#
# To discover ids/parameter triples for other shortcuts:
# 1) Configure a shortcut manually in System Settings.
# 2) Run: defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys
# 3) Copy the target id and its parameters into HOTKEYS.

MODULE_NAME=macos-keyboard-shortcuts
SKIP_INSTALL=1

DOMAIN="com.apple.symbolichotkeys"
PLIST="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"

HOTKEYS=(
    "64|1|103|5|1048576|Show Spotlight search"
    "61|0|32|49|786432|Select next source in Input menu"
    "60|1|98|11|1048576|Select previous input source"
)

source "$(dirname "$0")/../../scripts/common.sh"

ensure_hotkeys_root() {
    if ! defaults read "$DOMAIN" AppleSymbolicHotKeys >/dev/null 2>&1; then
        defaults write "$DOMAIN" AppleSymbolicHotKeys -dict
    fi
}

set_symbolic_hotkey() {
    local id="$1"
    local enabled="$2"
    local p0="$3"
    local p1="$4"
    local p2="$5"

    /usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:$id" "$PLIST" 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id dict" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:enabled bool $enabled" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:value dict" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:value:type string standard" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:value:parameters array" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:value:parameters:0 integer $p0" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:value:parameters:1 integer $p1" "$PLIST"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:$id:value:parameters:2 integer $p2" "$PLIST"
}

apply() {
    log_applying_config
    ensure_hotkeys_root

    local entry id enabled p0 p1 p2 description
    for entry in "${HOTKEYS[@]}"; do
        IFS="|" read -r id enabled p0 p1 p2 description <<< "$entry"
        set_symbolic_hotkey "$id" "$enabled" "$p0" "$p1" "$p2"
        echo "• Applied hotkey $id: $description"
    done

    killall cfprefsd 2>/dev/null || true
    killall SystemUIServer 2>/dev/null || true

    log_success
}

run_module "$@"
