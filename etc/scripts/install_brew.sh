#!/bin/bash

# Install brew package manager

brew -v > /dev/null

if [ $? -eq 0 ]
then
    echo "Brew installed!"
else 
    echo "Installing Brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    if [ $? -ne 0 ]
        then
            echo "Brew not installed!"
            exit 1
        else
            echo "Brew installation finished!"
        fi
fi
