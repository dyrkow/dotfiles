# Dotfiles

## New Mac install (one command)

```bash
TARGET_DIR="$HOME/work/tmp/dotfiles" && mkdir -p "$TARGET_DIR" && curl -fsSL "https://github.com/dyrkow/dotfiles/archive/refs/heads/master.tar.gz" | tar -xz --strip-components=1 -C "$TARGET_DIR"
```

## Commands (inside repo)

- **Bootstrap everything (install all + apply all configs)**:

```bash
make bootstrap
```

- **Install all apps**

```bash
make install
```

- **Apply all configs**

```bash
make apply
```

- **Install/Update one program** (examples):

```bash
make install zsh
make install google-chrome
make install cursor
make install xcode
```

- **Apply config for one program** (examples):

```bash
make apply zsh
make apply git
make apply tmux
make apply nvim
make apply docker
make apply aerospace
```

- **Bootstrap one program (install + apply)**:

```bash
make bootstrap zsh
make bootstrap cursor
```

## Add new program

1. Create folder `apps/<program>/` (name: lower-case latin, words separated with `-`).
2. Add `apps/<program>/bootstrap.sh` that defines:
   - `install()` - how to install the program
   - `apply()` - how to apply configuration (can be no-op: `apply(){ :; }`)

For Homebrew/mas installs, prefer using `scripts/helper.sh` functions (`install_cask`, `install_formula`, `install_mas_id`) to keep `bootstrap.sh` minimal.
