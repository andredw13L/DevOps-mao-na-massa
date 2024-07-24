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
