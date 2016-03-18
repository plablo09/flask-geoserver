sudo apt-get update
#install and configure apache, tomcat and geoserver
sudo apt-get -y install apache2 tomcat7 tomcat7-admin
wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.4.0/geoserver-2.4.0-war.zip
unzip geoserver-2.4.0-war.zip geoserver.war
sudo mv geoserver.war /var/lib/tomcat7/webapps/
sudo a2enmod proxy proxy_ajp
sudo echo ProxyPass '/geoserver ajp://localhost:8009/geoserver' > /etc/apache2/conf.d/proxy.conf
sudo service apache2 restart

sudo apt-get -y install python-dev
sudo apt-get -y install python-pip
sudo pip install Flask
