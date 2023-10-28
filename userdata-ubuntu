#!bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 -y
echo "Hello world from $(hostname -I)" > /var/www/html/index.html
sudo systemctl restart apache2