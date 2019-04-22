# Dotfiles

## Requirements
* MacOS Mojave
* Brew

## Setup
1. Clone this repo
2. Use command `install.sh`

## Reset
For clear your settings to default state

Use command `reset.sh`

## Overview

### Aliases

`ls` - show all hidden files how list

`config` - open nvim config in nvim

### Enviroment

`PATH` - paths to search folders

`ANDROID_HOME` - for Android SDK

### Utiliteas

* `brew` - OS package manager
* `git` - CVS system
* `tmux` - terminal multiplexer
* `npm & node` - NodeJS
* `yarn` - package manager for node

### Files
#### Shell
* `.bash_profile`

#### Git
* `.gitconfig`
* `.gitignore`

#### VIM
* `init.vim` - nvim config

#### Tempopary part
brew install nvim

// install plug manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
cd ~/.config & makedir nvim & cd nvim & touch init.vim
vim ~/.config/nvim/init.vim

## Tmux

<kbd>Ctrl</kbd>+<kbd>a</kbd>+<kbd>s</kbd> - show attached settions

`tmux attach -t <number settion>` - go to session

`tmux kill-session -t <session name>` - kill named session

`tmux new -s <session name>` - create named session

`tmux ls` - show all sessions

`tmux detach` - detach session - <kbd>Ctrl</kbd>+<kbd>a</kbd>+<kbd>d</kbd>


### General -> command (start tmux on start your terminal)
tmux attach -t base || tmux new -s base
