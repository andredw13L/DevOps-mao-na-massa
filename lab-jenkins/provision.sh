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

sudo usermod -aG docker jenkins

sudo systemctl restart jenknis

# Instalação do sonar scanner

sudo apt-get install wget unzip -y

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.1.0.4477-linux-x64.zip

unzip sonar-scanner-cli-6.1.0.4477-linux-x64.zip -d /opt/

mv /opt/sonar-scanner-6.1.0.4477-linux-x64 /opt/sonar-scanner

chown -R jenkins:jenkins /opt/sonar-scanner

echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile


# Instalação do Node.js

sudo apt-get install -y curl

curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

sudo -E bash nodesource_setup.sh

sudo apt-get install -y nodejs

node -v
