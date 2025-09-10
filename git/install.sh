#!/bin/bash

git --version > /dev/null

if [ $? -eq 0 ]
then
    echo "[Git] - already installed!"
else
    echo "[Git] installing..."
    /bin/bash -c "$(brew install git)"
    if [ $? -ne 0 ]
    then
        echo: "[Git] - installation failed!"
        exit 1
    else
        echo "[Git] - installation finished!"
    fi
fi
