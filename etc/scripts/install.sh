#!/bin/bash

# This script install all environment apps if needed
1. Install brew by command
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Install ansible by command
```
brew install ansible
```
3. Run ansible scripts for setup environment

# Install
./install_brew.sh
./install_emacs.sh
./install_clisp.sh


# Numbers
# -eq равно
# -ge больше или равно
# -gt больше
# -ne неравно
# -le меньше или равно
# -lt меньше

# Strings
# = равно
# != неравно
# \> больше
# \< меньше
# -n не пустая
# -z пустая

# Files
# d file Проверяет, существует ли файл, и является ли он директорией.
# -e file Проверяет, существует ли файл.
# -f file Проверяет, существует ли файл, и является ли он файлом.
# -r file Проверяет, существует ли файл, и доступен ли он для чтения.
# -s file Проверяет, существует ли файл, и не является ли он пустым.
# -w file Проверяет, существует ли файл, и доступен ли он для записи.
# -x file Проверяет, существует ли файл, и является ли он исполняемым.
# file1 -nt file2 Проверяет, новее ли file1, чем file2.
# file1 -ot file2 Проверяет, старше ли file1, чем file2.
# -O file Проверяет, существует ли файл, и является ли его владельцем текущий пользователь.
# -G file Проверяет, существует ли файл, и соответствует ли его идентификатор группы идентификатору группы текущего пользователя.
