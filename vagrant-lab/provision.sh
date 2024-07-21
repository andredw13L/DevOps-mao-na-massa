#!/usr/bin/env bash

echo "Installing Apache and setting it up..."

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install -y apache2

sudo cp -r /vagrant/html/* /var/www/html/

sudo apt-get autoremove -y

sudo service apache2 start
