#!/bin/bash

zsh --version > /dev/null

if [ $? -eq 0 ]
then
    echo "[Zsh] - already installed!"
else
    echo "[Zsh] - installing..."
    /bin/bash -c "$(brew install zsh)"
    if [ $? -ne 0 ]
    then
        echo: "[Zsh] - installation failed!"
        exit 1
    else
        echo "[Zsh] - installation finished!"
    fi
fi
