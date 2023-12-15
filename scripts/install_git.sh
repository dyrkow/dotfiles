#!/bin/bash

git --version > /dev/null

if [ $? -eq 0 ]
then
    echo "Git already installed!"
else
    echo "Installing git..."
    /bin/bash -c "$(brew install git)"
    if [ $? -ne 0 ]
    then
        echo: "Git not installed"
        exit 1
    else
        echo "Git installation finished!"
    fi
fi
