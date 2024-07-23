#/bin/bash

echo "Instalando o Docker"

sudo apt-get install -y docker.io

sudo systemctl start docker

sudo systemctl enable docker

sudo apt-get install -y docker-compose
