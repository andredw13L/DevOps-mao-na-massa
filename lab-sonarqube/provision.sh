#/usr/bin/bash

sudo apt-get install -y wget openjdk-17-jdk unzip

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.6.0.92116.zip

unzip sonarqube-10.6.0.92116.zip -d /opt/

mv /opt/sonarqube-10.6.0.92116 /opt/sonarqube

useradd sonar

chown -R sonar:sonar /opt/sonarqube

touch /etc/systemd/system/sonar.service

echo > /etc/systemd/system/sonar.service

cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target netowork.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT

service sonar start


# Instalação do sonar scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.1.0.4477-linux-x64.zip

unzip sonar-scanner-cli-6.1.0.4477-linux-x64.zip -d /opt/

mv /opt/sonar-scanner-6.1.0.4477-linux-x64 /opt/sonar-scanner

chown -R sonar:sonar /opt/sonar-scanner

echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile

# Instalação do Node.js

sudo apt-get install -y curl

curl -fsSL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh

# Execute o comando do-release-upgrade para atualizar o ubuntu
# e instale essa ou uma versão mais recente do node
# para evitar erro com o sonar-scanner

# curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh

sudo -E bash nodesource_setup.sh

sudo apt-get install -y nodejs

node -v
