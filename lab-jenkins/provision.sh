#/bin/bash

yum install -y epel-release wget java-11-openjdk-devel git telnet



#sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/
#sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#yum install -y jenkins

sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install jenkins -y

systemctl daemon-reload

# Instalação do docker e do docker compose
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io -y

sudo systemctl start docker
sudo systemctl enable docker

sudo yum install -y nano

sudo curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

systemctl daemon-reload
systemctl restart docker


# Instalar sonar scanner

yum install -y  unzip

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip

unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt/

mv /opt/sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner

chown -R jenkins:jenkins /opt/sonar-scanner

echo "export PATH=$PATH:/opt/sonar-scanner/bin" | sudo tee -a /etc/profile

# Instalar Node.js

curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -

sudo yum install nodejs -y



usermod -aG docker jenkins

sudo systemctl enable jenkins

sudo service jenkins start
