#!/bin/bash

Clean()
{
    echo "Clean configuration folder"
    rm -rf ~/.emacs.d
    echo "1. Clean configuration folder finished!"
}

Copy()
{
    echo "Build emacs configuration"
    # TODO: дописать скрипт компилации в бинарник для большей производительности
    echo "Build emacs configuration finished!"
}

echo "Start release tmux configuration"
Clean
Copy
echo "Release finished!"
