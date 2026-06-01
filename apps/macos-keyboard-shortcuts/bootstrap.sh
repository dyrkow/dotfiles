#!/usr/bin/env bash
set -e
# все равно не работает, никаким образом не работает, не меняет

# This module configures selected macOS symbolic hotkeys directly in user prefs.
# Domain: com.apple.symbolichotkeys
# File: ~/Library/Preferences/com.apple.symbolichotkeys.plist
#
# Add new shortcuts by appending one row to HOTKEYS:
#   "<id>|<enabled>|<p0>|<p1>|<p2>|<description>"
# Where `value.parameters` maps to:
# - p0: character code (or 65535 for non-printable keys)
# - p1: key code
# - p2: modifier flags bitmask (for example, 1048576 = Cmd)
#
# To discover ids/parameter triples for other shortcuts:
# 1) Configure a shortcut manually in System Settings.
# 2) Run: defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys
# 3) Copy the target id and its parameters into HOTKEYS.

source "$(dirname "$0")/../../scripts/common.sh"

MODULE_NAME="macos-keyboard-shortcuts"
DOMAIN="com.apple.symbolichotkeys"
PLIST="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"

HOTKEYS=(
    # id 64 = Show Spotlight search (Cmd+G)
    "64|1|103|5|1048576|Show Spotlight search"
    # Input source switching: first disable alternate shortcut(s), then set one target shortcut.
    # id 61 = Select next source in Input menu (disabled to avoid Cmd+Space fallback)
    "61|0|32|49|786432|Select next source in Input menu"
    # id 60 = Select previous input source (Cmd+B)
    "60|1|98|11|1048576|Select previous input source"
)

install() {
    # Hotkeys are macOS user preferences; no external install step needed.
    :
}

ensure_hotkeys_root() {
    # Create the root dictionary if it does not exist yet.
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

    # Refresh caches so changes show up in System Settings immediately.
    killall cfprefsd 2>/dev/null || true
    killall SystemUIServer 2>/dev/null || true

    echo "✅ applied successfully"
}

run_main "$@"
