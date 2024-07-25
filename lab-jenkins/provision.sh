#/bin/bash
echo "Instalando o Jenkins"

sudo apt-get install -y wget

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key


echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install fontconfig openjdk-17-jre -y
sudo apt-get install jenkins -y

sudo systemctl start jenkins

sudo systemctl enable jenkins

sudo systemctl daemon-reload


echo "Instalando o Docker"

sudo apt-get install -y docker.io

sudo systemctl start docker

sudo systemctl enable docker

sudo apt-get install -y docker-compose

sudo usermod -aG docker $USER

newgrp docker

sudo systemctl daemon-reload
