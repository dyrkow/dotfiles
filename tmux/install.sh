#!/bin/bash

tmux -V > /dev/null

if [ $? -eq 0 ]
then
    echo "[Tmux] - already installed!"
else
    echo "[Tmux] installing..."
    /bin/bash -c "$(brew install tmux)"

    if [ $? -ne 0 ]
    then
        echo: "[Tmux] - installation failed!"
        exit 1
    else
        echo "[Tmux] - installation finished!"
    fi
fi
