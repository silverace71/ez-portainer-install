#!/bin/bash

echo "docker, docker compose, and portainer, alongside any other dependencies"
sleep 3
echo "This will reboot your system and you need sudo privileges. do you wish to continue (y/n)"
read confirm
if [[ $confirm == "y" ]]; then
    echo "please type your username"
        read name
    echo "Installing Docker"
        sudo apt update
        
else
        echo "installation canceled"
fi