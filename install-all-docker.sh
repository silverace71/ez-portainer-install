#!/bin/bash

##this is just checking and explaining things
echo "docker, docker compose, and portainer, alongside any other dependencies, do you wish to continue (y/n)"
read confirm
    if [[ $confirm == "y" ]]; then
        name=$(whoami)
        echo "Installing Docker"
##This is where all the commands are

            sudo usermod -aG docker $name

            if [ -x "$(command -v apt-get)" ]; then
            sudo curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo apt-get install libffi-dev libssl-dev
            sudo apt install python3-dev -y
            sudo apt-get install -y python3 python3-pip
            sudo pip3 install docker-compose
            sudo docker volume create portainer_data
            sudo docker pull portainer/portainer-ce:latest
            sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
            elif [ -x "$(command -v dnf)" ]; then
            sudo dnf -y install dnf-plugins-core
            sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
            sudo dnf install docker-ce docker-ce-cli containerd.io
            sudo docker volume create portainer_data
            sudo docker pull portainer/portainer-ce:latest
            sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
            elif [ -x "$(command -v yum)" ]; then
            sudo yum -y install yum-utils
            sudo yum-config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
            sudo yum install docker-ce docker-ce-cli containerd.io
            sudo docker volume create portainer_data
            sudo docker pull portainer/portainer-ce:latest
            sudo docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
            elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S docker
            sudo systemctl start docker
            sudo systemctl enable docker
            sudo pacman -S docker-compose
            sudo systemctl start docker-compose
            sudo systemctl enable docker-compose
            sudo docker volume create portainer_data
            sudo docker pull portainer/portainer-ce:latest
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