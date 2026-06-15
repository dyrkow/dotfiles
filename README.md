# Dotfiles

## New Mac install

```bash
curl -fsSL "https://github.com/dyrkow/dotfiles/raw/refs/heads/master/scripts/install.sh" -o /tmp/dotfiles-install.sh && bash /tmp/dotfiles-install.sh
cd ~/Work/Self/dotfiles && make bootstrap
```

## Commands

`<app>` is the folder name under `apps/`.

| Command | Description |
|---|---|
| `make install [app]` | Install app (skips if already installed) |
| `make apply [app]` | Apply config (always overwrites) |
| `make bootstrap [app]` | Install, then apply config |

Without `[app]`, the command runs for all modules. Stops on the first error.

Wrong app name prints an error with the list of available modules.

## Add app

1. Create `apps/<name>/bootstrap.sh` (`<name>` — lower-case latin, words separated with `-`).
2. Set variables and call `run_module`:

```bash
#!/usr/bin/env bash
set -euo pipefail

MODULE_NAME=<name>
INSTALL_CASK=<name>                    # or INSTALL_FORMULA / INSTALL_MAS_ID
APPLY_FILES=(".config:$HOME/.config")  # optional

source "$(dirname "$0")/../../scripts/common.sh"
run_module "$@"
```

For config-only modules set `SKIP_INSTALL=1` and define custom `apply()` if needed.

See [`scripts/common.sh`](scripts/common.sh) for available variables and helpers.

## Remove app

1. Delete `apps/<name>/` from the repo.
2. Uninstall the program manually if needed (`brew uninstall`, remove from Applications, etc.).
3. Remove copied configs from `$HOME` manually if needed — dotfiles does not track or clean them.

## Notes

- `nvim` and `vimlua` both install Neovim — use only one on a new machine.
- Modules with `SKIP_INSTALL=1` support `make apply` only, not `make install`.
