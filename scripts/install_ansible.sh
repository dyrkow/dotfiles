#!/bin/bash

ansible --version > /dev/null

if [ $? -eq 0 ]
then
    echo "Ansible already installed!"
else
    echo "Installing ansible..."
    /bin/bash -c "$(brew install ansible)"
    if [ $? -ne 0 ]
    then
        echo: "Ansible not installed"
        exit 1
    else
        echo "Ansible installation finished!"
    fi
fi
