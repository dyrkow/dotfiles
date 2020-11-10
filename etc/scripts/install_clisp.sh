#!/bin/bash

# Install common lisp compiler

clisp --version > /dev/null

if [ $? -eq 0 ]
then
    echo "CLisp installed. Skip step"
else 
    echo "CLisp not installed. Installing CLisp..."
    brew install clisp
    if [ $? -ne 0 ]
        then
            echo "CLisp not installed!"
            exit 1
        else 
            echo "CLisp installation finished!"
        fi
fi
