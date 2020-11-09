#!/bin/bash
# defaultPathToEmacConfiguration="~/"
# defaultEmacsConfigurationFolder=".emacs.d/"
# defaultEmacsConfigurationFileName="init.el"

Clean()
{
    echo "1. Clean folder in OS..."
    rm -rf ~/.emacs.d
    echo "1. Clean folder finished!"
}

Copy()
{
    echo "2. Copy build in OS..."
    cp -r ../../.emacs.d ~/.emacs.d
    echo "2. Copy finished!"
}

echo "Start release emacs configuration to OS..."
Clean
Copy
echo  "Release finished!"
