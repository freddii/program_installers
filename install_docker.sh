#!/bin/bash
#to run this script go into the folder where it is then run: ./install_docker.sh
#touch install_docker.sh && chmod +x install_docker.sh && nano install_docker.sh
#
set -eu
#
#based on https://docs.docker.com/engine/install/ubuntu/
#grep --color --perl-regexp 'vmx|svm' /proc/cpuinfo
echo "Run the following command to uninstall all conflicting packages:"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
#
sudo apt -y update
#sudo apt -y upgrade
#setup the repo
#sudo apt-get install \
#    apt-transport-https \
#    ca-certificates \
#    curl \
#    gnupg-agent \
#    software-properties-common -y
#sudo apt install lsb-release gnupg2 apt-transport-https ca-certificates curl software-properties-common -y
sudo apt-get install ca-certificates curl gnupg
echo "Add Docker’s official GPG key"
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
#curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian.gpg
#verify key
#sudo apt-key fingerprint 0EBFCD88 
#search for 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
#add stable amd64 repo
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#
echo "set up the repository:"
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
#update repo and install docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
#test docker
sudo docker run hello-world

echo "add your user to docker group to run docker commands"
echo "sudo usermod -aG docker $USER"
#
#
##check what containers are running
#sudo docker ps
##pause a container
#sudo docker pause e84a5b6c0985
#sudo docker unpause e84a5b6c0985
##stop a container
#sudo docker stop e84a5b6c0985
##docker list all containers
#docker ps -a
##docker rm a container
#docker rm CONTAINER_ID
##docker rm all stopped containers
#docker rm $(docker ps -a -q)
##docker list all images
#sudo docker images
##remove a docker image
#sudo docker rmi bf756fb1ae65
##remove all docker images
#sudo docker rmi $(docker images -q)
#
#sudo docker run wordpress
#sudo docker run nginx
#sudo docker run ubuntu
#sudo docker run maven
#sudo docker run nextcloud