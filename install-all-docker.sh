#!/bin/bash

##this is just checking and explaining things
echo "docker, docker compose, and portainer, alongside any other dependencies, do you wish to continue (y/n)"
read confirm
    if [[ $confirm == "y" ]]; then
        echo "please type your username"
            read name
        echo "Installing Docker"
##This is where all the commands are
            sudo apt update
            sudo curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo usermod -aG docker $name
            sudo apt-get install libffi-dev libssl-dev
            sudo apt install python3-dev -y
            sudo apt-get install -y python3 python3-pip
            sudo pip3 install docker-compose
            sudo docker volume create portainer_data
            sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
##telling you where portainer is
    lanIp="$(ip -4 -o -br addr|awk '$0 ~ /^[we]\w+\s+UP\s+/ {str = gsub("/[1-9][0-9]*", "", $0); print $3}')";

        echo "Portainer is located at: https://${lanIp}:9443";
        sleep 3
##reboot time
    echo "it is HIGHLY reccomended that you reboot your system, do you wish to reboot now (y/n)"
        read reboot
            if [[ $reboot == "y" ]]; then
                sudo reboot
            else
                echo "To avoid any issues you must reboot or log out and back in. Otherwise you might run into issues. Good luck."
            fi

        
    else
        echo "installation canceled"
fi