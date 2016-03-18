#!/bin/bash
sudo apt-get update
#install and configure apache, tomcat and geoserver
if ! type "apache2" > /dev/null; then
    echo "Apache already installed"
else
    sudo apt-get -y install apache2
fi

if ! [ -f "/etc/tomcat7/server.xml" ]; then
  sudo apt-get -y install tomcat7 tomcat7-admin
fi


sudo apt-get -y install unzip
if [ -f "/home/vagrant/geoserver-2.8.2-war.zip" ]
then
	echo "geoserver alredy found."
else
	wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.8.2/geoserver-2.8.2-war.zip
fi

unzip /home/vagrant/geoserver-2.8.2-war.zip geoserver.war
sudo mv /home/vagrant/geoserver.war /var/lib/tomcat7/webapps/
sudo a2enmod proxy proxy_http
sudo rm /etc/apache2/sites-available/000-default.conf
sudo cp /vagrant/provision/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo service apache2 restart
sudo service tomcat7 restart

sudo apt-get -y install python-dev
sudo apt-get -y install python-pip
sudo pip install Flask
