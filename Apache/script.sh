#!/bin/bash
echo "Atualizando Dispositivo"
apt-get update && apt-get upgrade -y
echo "Baixando apache"
apt-get install apache2  -y
echo "baixando dependencias para container"
apt-get install net-tools
echo "instalando unzip"
apt-get install unzip -y
echo "instalando wget caso seja um container"
apt-get install wget -y
echo "baixando link do curso"
cd /tmp && wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo "descompactando arquivo main"
unzip main.zip
echo "transferindo de linux-site-dio para /var/www/html"
cp -r * /var/www/html
echo "Levantando Serviços"
service apache2 start
echo `service apache2 status`