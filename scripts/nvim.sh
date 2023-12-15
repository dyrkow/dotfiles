#!/bin/bash

nvim --version > /dev/null

if [ $? -eq 0 ]
then
    echo "[Nvim] - already installed!"
else
    echo "[Nvim] installing..."
    /bin/bash -c "$(brew install neovim)"

    if [ $? -ne 0 ]
    then
        echo: "[Nvim] - installation failed!"
        exit 1
    else
        echo "[Nvim] - installation finished!"
    fi
fi
