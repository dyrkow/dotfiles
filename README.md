# Dotfiles

## New Mac install (one command)

```bash
curl -fsSL "https://github.com/dyrkow/dotfiles/raw/refs/heads/master/scripts/install.sh" -o /tmp/dotfiles-install.sh && bash /tmp/dotfiles-install.sh
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

For Homebrew/mas installs, prefer using `scripts/common.sh` helper functions (`install_cask`, `install_formula`, `install_mas_id`) to keep `bootstrap.sh` minimal.
