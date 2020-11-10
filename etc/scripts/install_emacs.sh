#!/bin/bash

# Install emacs editor

emacs --version > /dev/null

if [ $? -eq 0 ]
then
    echo "Emacs installed. Skip step"
else 
    echo "Emacs not installed. Installing Emacs..."
    brew install emacs
    if [ $? -ne 0 ]
        then
            echo "Emacs not installed!"
            exit 1
        else 
            echo "Emacs installation finished!"
        fi
fi
