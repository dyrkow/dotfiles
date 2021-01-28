# Dotfiles
This repo contain my environment

## TODO: не писать скрипты, юзаем вот это дело https://www.ansible.com/

## Requirements
* MacOS Mojave
* Brew

## Setup
1. Clone this repo to user root (like this `~/dotfiles`)
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

`tmux a` - attach last session
`tmux detach` - detach session - <kbd>Ctrl</kbd>+<kbd>a</kbd>+<kbd>d</kbd>

<kbd>Ctrl</kbd>+<kbd>a</kbd>+<kbd>$</kbd> - rename current session



### General -> command (start tmux on start your terminal)
tmux attach -t base || tmux new -s base


git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
brew install zsh-syntax-highlighting

### npm
Install globally

- fixjson
- eslint
- prettier

npm install --global speed-test

## Users on windows

`git config core.autocrlf false` - используем конец строки Linux


VIM Performance
```
nvim --startuptime start.log package.json
```

install homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
insalll vim file manager from brew
```
brew install vifm
```

install gpg for secure data and sign github commits

```
brew install gnupg2
```

(support util for enter passphrase `brew install pinentry-mac`)
(install GPG Suite for enter passphrase only one https://gpgtools.org/)

up gpg infrastructure, output example
```
gpg: создан каталог '/Users/user/.gnupg'
gpg: создан щит с ключами '/Users/user/.gnupg/pubring.kbx'
gpg: /Users/user/.gnupg/trustdb.gpg: создана таблица доверия
```

if you see error when `gpg --gen-key` just use `rm -rf ~/.gnupg`
`gpg --full-generate-key`



`yarn add react-devtools` - devtools for debuge view in RN



Если есть разные проекты, которые работают с разными версиями nodejs
Установить nvm
Добавить в каждый проект .nvmrc с вервией ноды которую использует проект v10.0.0
При заходе в проект выполнить nvm install & nvm use



`open -a Simulator` - открыть симулятор IOS



Когда подключаются репозитории приватно напрямую в package.json можно у этого пакета определить скрипт prepare с помощью которого пакет будет собран
Это избавляет нас от момента хранения собранной версии в git 
https://blog.jim-nielsen.com/2018/installing-and-building-an-npm-package-from-github/

Поднять эмулятор андроид
`emulator -avd avd_name`

Собрать bundle(aap) файл android приложения ./gradlew bundleRelease


Verifyed commits on github
1. Generate key https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key
List of keys `gpg --list-secret-keys --keyid-format LONG`
2. Change .gitconfig file
```diff
[user]
	name = Dyrkov Andrey
	email = webworkdeveloper@gmail.com
+	signingkey = XXXXXXXXXXXXXXXX
+[commit]
+	gpgsign = true
+[gpg]
+	program = gpg2
```

vim, show path to the current file 1+ctrl+g

`brew install gh` - utility for working with github, open PR, close, merge and t.c.



Android sdk tools, sdkmanager, чтобы не устанавливать Android Studio
https://developer.android.com/studio/index.html#downloads

Поставить Java8
 `brew install openjdk@8`
