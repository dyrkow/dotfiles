#!/bin/bash

nvim --version > /dev/null

if [ $? -eq 0 ]
then
    echo "[Nvim] - already installed!"
else
    echo "[Nvim] installing..."
    /bin/bash -c "$(brew install neovim)"

    # 1. Устанавливает Plug плагин для загрузки плагинов
    # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    #    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    # 2. После его установки нужно вызывать cvim чтобы поставить конфигурацию nvim

    if [ $? -ne 0 ]
    then
        echo: "[Nvim] - installation failed!"
        exit 1
    else
        echo "[Nvim] - installation finished!"
    fi
fi
