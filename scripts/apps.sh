#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APPS_DIR="${ROOT}/apps"

usage() {
    echo "Usage: $0 install|apply|bootstrap [app]" >&2
    exit 1
}

list_apps() {
    local script name app result=""
    local -a apps=()
    for script in "${APPS_DIR}"/*/bootstrap.sh; do
        [[ -f "${script}" ]] || continue
        name="$(basename "$(dirname "${script}")")"
        apps+=("${name}")
    done
    if ((${#apps[@]} == 0)); then
        echo "(none)"
        return
    fi
    while IFS= read -r app; do
        if [[ -n "${result}" ]]; then
            result+=", "
        fi
        result+="${app}"
    done < <(printf '%s\n' "${apps[@]}" | sort)
    echo "${result}"
}

validate_app() {
    local app="$1"
    local bootstrap="${APPS_DIR}/${app}/bootstrap.sh"
    if [[ ! -f "${bootstrap}" ]]; then
        echo "ERROR: app '${app}' not found" >&2
        echo "Available apps: $(list_apps)" >&2
        exit 1
    fi
}

run_for_app() {
    local cmd="$1"
    local app="$2"
    local bootstrap="${APPS_DIR}/${app}/bootstrap.sh"
    validate_app "${app}"
    bash "${bootstrap}" "${cmd}"
}

run_for_all() {
    local cmd="$1"
    local script
    for script in "${APPS_DIR}"/*/bootstrap.sh; do
        [[ -f "${script}" ]] || continue
        bash "${script}" "${cmd}"
    done
}

run_bootstrap() {
    local app="${1:-}"
    if [[ -n "${app}" ]]; then
        run_for_app install "${app}"
        run_for_app apply "${app}"
    else
        run_for_all install
        run_for_all apply
    fi
}

main() {
    local cmd="${1:-}"
    local app="${2:-}"

    case "${cmd}" in
        install|apply)
            if [[ -n "${app}" ]]; then
                run_for_app "${cmd}" "${app}"
            else
                run_for_all "${cmd}"
            fi
            ;;
        bootstrap)
            run_bootstrap "${app}"
            ;;
        *)
            usage
            ;;
    esac
}

main "$@"
