#!/bin/bash

Clean()
{
    echo "Clean configuration folder"
    rm -rf ~/.emacs.d
    echo "1. Clean configuration folder finished!"
}

Build()
{
    echo "Build emacs configuration"
    # TODO: дописать скрипт компилации в бинарник для большей производительности
    echo "Build emacs configuration finished!"
}

Copy()
{
    echo "2. Copy build in OS..."
    cp -r ../../.emacs.d ~/.emacs.d
    echo "2. Copy finished!"
}

echo "Start release emacs configuration to OS..."
Clean
Build
Copy
echo  "Release finished!"
