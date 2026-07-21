#!/usr/bin/env bash

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

log_skip() {
    echo "✅ ${MODULE_NAME} already installed"
}

log_success() {
    echo "✅ applied successfully"
}

fail() {
    echo
    print_separator
    exit 1
}

# Main command runner
run_main() {
    local cmd="${1:-}"
    local usage="Usage: $0"
    local available_commands=""

    if [[ -z "${cmd}" ]]; then
        echo "Usage: bootstrap.sh install|apply" >&2
        exit 1
    fi

    if declare -F install &> /dev/null; then
        available_commands="install"
    fi
    if declare -F apply &> /dev/null; then
        if [[ -n "${available_commands}" ]]; then
            available_commands="${available_commands}|apply"
        else
            available_commands="apply"
        fi
    fi
    usage="$usage [${available_commands}]"

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

# Skip install when a path already exists
skip_if_path_exists() {
    local path="$1"
    if [[ -e "$path" ]]; then
        log_skip
        return 0
    fi
    return 1
}

# Skip install when a command is already available
skip_if_command_exists() {
    local cmd="$1"
    if command -v "$cmd" >/dev/null 2>&1; then
        log_skip
        return 0
    fi
    return 1
}

# Homebrew/mas helper functions
ensure_brew() {
    # In case brew was just installed, ensure it's in the PATH for this script's execution.
    # This is mainly for Apple Silicon where brew is in /opt/homebrew.
    if [[ -x /opt/homebrew/bin/brew ]] && [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    if ! command -v brew >/dev/null 2>&1; then
        echo "ERROR: Homebrew is not installed." >&2
        echo "Please run the main installation script from the README first." >&2
        exit 1
    fi
}

install_formula() {
    local formula="$1"
    ensure_brew
    if brew list --formula "${formula}" &>/dev/null; then
        log_skip
        return 0
    fi
    brew install "${formula}"
    echo "✅ installed ${MODULE_NAME}"
}

_cask_app_path() {
    local cask="$1"
    brew info --cask "${cask}" 2>/dev/null | grep -oE '/Applications/[^ )]+\.app' | head -1
}

install_cask() {
    local cask="$1" app_path brew_args
    ensure_brew
    if brew list --cask "${cask}" &>/dev/null; then
        log_skip
        return 0
    fi
    brew_args=(install --cask "${cask}")
    app_path="$(_cask_app_path "${cask}")"
    if [[ -n "${app_path}" && -d "${app_path}" ]]; then
        brew_args+=(--adopt)
    fi
    brew "${brew_args[@]}"
    echo "✅ installed ${MODULE_NAME}"
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
    if mas list 2>/dev/null | grep -qE "^${id}[[:space:]]"; then
        log_skip
        return 0
    fi
    mas install "${id}"
    echo "✅ installed ${MODULE_NAME}"
}

# Apply helpers (paths relative to SCRIPT_DIR unless absolute)
apply_reset_dir() {
    local dir="$1"
    rm -rf "${dir}"
    mkdir -p "${dir}"
}

apply_copy_file() {
    local src="$1"
    local dst="$2"
    local parent
    parent="$(dirname "${dst}")"
    mkdir -p "${parent}"
    if cp "${src}" "${dst}"; then
        return 0
    fi
    echo "❌ ERROR: failed to copy ${src} -> ${dst}" >&2
    return 1
}

# Copy entries from APPLY_FILES: "relative_src:absolute_dst" or "relative_src:relative_dst"
apply_copy_files() {
    local entry rel_src dst src
    log_applying_config
    for entry in "${APPLY_FILES[@]}"; do
        rel_src="${entry%%:*}"
        dst="${entry#*:}"
        if [[ "${rel_src}" == "${entry}" ]]; then
            echo "❌ ERROR: invalid APPLY_FILES entry (expected src:dst): ${entry}" >&2
            return 1
        fi
        if [[ "${rel_src}" == /* ]]; then
            src="${rel_src}"
        else
            src="${SCRIPT_DIR}/${rel_src}"
        fi
        if ! apply_copy_file "${src}" "${dst}"; then
            return 1
        fi
    done
    log_success
}

# Copy directories/files into APPLY_DIR (paths relative to SCRIPT_DIR)
apply_copy_tree() {
    local rel_path src
    log_applying_config
    for rel_path in "${APPLY_TREE[@]}"; do
        src="${SCRIPT_DIR}/${rel_path}"
        if [[ -d "${src}" ]]; then
            if ! cp -r "${src}" "${APPLY_DIR}/"; then
                echo "❌ ERROR: failed to copy tree ${rel_path}" >&2
                return 1
            fi
        elif [[ -f "${src}" ]]; then
            if ! apply_copy_file "${src}" "${APPLY_DIR}/$(basename "${rel_path}")"; then
                return 1
            fi
        else
            echo "❌ ERROR: apply source not found: ${src}" >&2
            return 1
        fi
    done
    log_success
}

# Declarative module runner. Source from apps/<name>/bootstrap.sh after setting variables.
#
# Install (one of):
#   INSTALL_CASK, INSTALL_FORMULA, INSTALL_MAS_ID
#   SKIP_INSTALL=1 — no install step
#
# Apply (optional):
#   APPLY_FILES=("src:$HOME/.config" ...)
#   APPLY_DIR + APPLY_FILES — reset dir then copy files
#   APPLY_DIR + APPLY_TREE — reset dir then copy trees/files
#
# Custom install()/apply() in bootstrap.sh override generated functions.

module_init() {
    local i src
    if [[ -z "${MODULE_NAME:-}" ]]; then
        echo "ERROR: MODULE_NAME is required" >&2
        exit 1
    fi
    if [[ -n "${SCRIPT_DIR:-}" ]]; then
        return 0
    fi
    for (( i = 0; i < ${#BASH_SOURCE[@]}; i++ )); do
        src="${BASH_SOURCE[i]}"
        if [[ "${src}" =~ (^|/)apps/[^/]+/bootstrap\.sh$ ]]; then
            SCRIPT_DIR="$(cd "$(dirname "${src}")" && pwd)"
            return 0
        fi
    done
    echo "ERROR: could not determine SCRIPT_DIR (expected apps/<name>/bootstrap.sh in call stack)" >&2
    exit 1
}

_module_define_install() {
    if declare -F install &>/dev/null; then
        return 0
    fi
    if [[ "${SKIP_INSTALL:-}" == "1" ]]; then
        install() { :; }
        return 0
    fi
    if [[ -n "${INSTALL_CASK:-}" ]]; then
        install() { install_cask "${INSTALL_CASK}"; }
        return 0
    fi
    if [[ -n "${INSTALL_FORMULA:-}" ]]; then
        install() { install_formula "${INSTALL_FORMULA}"; }
        return 0
    fi
    if [[ -n "${INSTALL_MAS_ID:-}" ]]; then
        install() { install_mas_id "${INSTALL_MAS_ID}"; }
        return 0
    fi
}

_module_apply_files_count() {
    if [[ -n "${APPLY_FILES+set}" ]]; then
        echo "${#APPLY_FILES[@]}"
    else
        echo 0
    fi
}

_module_apply_tree_count() {
    if [[ -n "${APPLY_TREE+set}" ]]; then
        echo "${#APPLY_TREE[@]}"
    else
        echo 0
    fi
}

_module_define_apply() {
    local files_count tree_count
    if declare -F apply &>/dev/null; then
        return 0
    fi
    files_count="$(_module_apply_files_count)"
    tree_count="$(_module_apply_tree_count)"
    if [[ "${files_count}" -eq 0 && "${tree_count}" -eq 0 ]]; then
        if declare -F install &>/dev/null; then
            apply() { :; }
        fi
        return 0
    fi

    if [[ -n "${APPLY_DIR:-}" ]]; then
        if [[ "${tree_count}" -gt 0 ]]; then
            apply() {
                apply_reset_dir "${APPLY_DIR}"
                apply_copy_tree
            }
        elif [[ "${files_count}" -gt 0 ]]; then
            apply() {
                apply_reset_dir "${APPLY_DIR}"
                apply_copy_files
            }
        fi
    elif [[ "${files_count}" -gt 0 ]]; then
        apply() { apply_copy_files; }
    fi
}

run_module() {
    module_init
    _module_define_install
    _module_define_apply
    run_main "$@"
}
