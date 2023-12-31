#! /bin/bash

#Check if Docker is installed
if ! command -v docker &> /dev/null; then
	echo "Docker not found. Proceeding to install.."
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
	sudo usermod -aG docker $USER
	echo "Docker installed."
else
	echo "Docker already present"
fi


#Check if Docker compose is installed
if ! command -v docker-compose &> /dev/null; then
	echo "Docker compose not found. Proceeding to install.."
	sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	echo "Docker compose installed."
else
	echo "Docker compose already present"
fi
