#!/bin/bash
#AUTO INSTALL .ONION WEBSITE ON THE DEEP !
#MADE BY STORMTROOPER42 
#
#

apt-get update && apt-get upgrade -y
apt-get remove --purge apache2 -y
apt-get install nginx -y

echo "Let's go to the deep baby !"
echo "##### INSTALL NGINX #####"
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.origin
wget https://gist.githubusercontent.com/stormtrooper42/d90ac037559f0c8788f0/raw/2ee860d4192233cbe6bec52091d1b78fbc694c30/nginx.conf 
mv nginx /etc/nginx/nginx.conf
rm -rf /etc/nginx/sites-available/default
wget https://gist.githubusercontent.com/stormtrooper42/2d76408ce75c7f4f0c71/raw/ba7f5acd600b011544c70f936b6bb79acdbbc656/default
mv default /etc/nginx/sites-available/default
service nginx restart
echo "DEBIAN SECURE"
echo "DebianBanner no" >> /etc/ssh/ssh_config
echo "SECURITY PURGE" 
echo "PURGE  : Rsyslog - Exim - PostFix - Sendmail"
apt-get remove --purge rsyslog -y
apt-get remove --purge exim -y
apt-get remove --purge postfix -y
apt-get remove --purge sendmail -y


echo "#################################"
echo "##         INSTALLING TOR      ##"
echo "#################################"
echo "deb http://deb.torproject.org/torproject.org $DISTRIB_CODENAME main" >> /etc/apt/sources.list
echo "deb-src http://deb.torproject.org/torproject.org $DISTRIB_CODENAME main" >> /etc/sources.list
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
apt-get update
apt-get install tor -y
wget https://gist.githubusercontent.com/stormtrooper42/114d4037de9ee9e35a08/raw/cfd41b8ac77ebfb8f7ea08d5d83ccce562451bec/torrc
mv /etc/tor/torrc /etc/tor/torrc.original
mv torrc /etc/tor/torrc
service tor start
apt-get install php5-fpm -y
service php5-fpm start
echo "FIREWALL CONFIG"
apt-get install ufw -y
ufw allow ssh
ufw enable
echo "WGET REMOVE"
apt-get remove wget -y
echo "IF YOU WANT WGET JUST "
echo "apt-get install wget"
echo "YOUR .ONION WEBSITE PRIVATE KEY"
cat /var/lib/tor/hidden_service/private_key
echo "YOUR .ONION WEBSITE"
cat /var/lib/tor/hidden_service/hostname
echo "YOUR WEBSITE DIRECTORY"
echo "/usr/share/nginx/www"
echo "YOUR TOR DIRECTORY"
echo "/var/lib/tor/hidden_service/"
