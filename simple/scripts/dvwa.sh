#!/bin/bash

## install dvwa

NAME="DVWA application"
IP=$(hostname -I | awk '{print $2}')
LOG_FILE="/vagrant/logs/install_dvwa.log"

VIRTUAL_HOST="/vagrant/files/dvwa.conf"
DVWA_PATH="/var/www/html/dvwa"
DVWA_CONFIG="$DVWA_PATH/config/config.inc.php"
DBNAME="dvwa"
DBUSER="dvwa"
DBPASSWD="p@ssw0rd"

echo "START - Install $NAME on "$IP

echo "=> [1]: Installing dvwa from github..."
mkdir -p /var/www/html
git clone https://github.com/digininja/DVWA.git $DVWA_PATH >> $LOG_FILE 2>&1
cp $DVWA_CONFIG.dist $DVWA_CONFIG

echo "=> [2]: Configuring php for dvwa..."
sed -i 's/allow_url_include = off/allow_url_include = on/gI' /etc/php/*/apache2/php.ini

echo "=> [3]: Changing dvwa configuration..."
sed -i "19s/dvwa/$DBNAME/g" $DVWA_CONFIG
sed -i "20s/dvwa/$DBUSER/g" $DVWA_CONFIG
sed -i "21s/p@ssw0rd/$DBPASSWD/g" $DVWA_CONFIG

echo "=> [4]: Changing dvwa files permissions..."
chown www-data:www-data $DVWA_PATH/hackable/uploads -R
chown www-data:www-data $DVWA_PATH/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
chown www-data:www-data $DVWA_PATH/config -R

echo "=> [5]: Adding apache2 virtualhost for dvwa..."
mkdir -p /etc/apache2/sites-available
cp $VIRTUAL_HOST /etc/apache2/sites-available
a2dissite 000-default >> $LOG_FILE 2>&1
a2ensite dvwa >> $LOG_FILE 2>&1
systemctl reload apache2

echo "=> [6]: Configuring dvwa database..."
if [ -n "$DBNAME" ] && [ -n "$DBUSER" ] && [ -n "$DBPASSWD" ] ;then
  mysql -e "CREATE DATABASE $DBNAME" \
  >> $LOG_FILE 2>&1
  mysql -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'" \
  >> $LOG_FILE 2>&1
fi

echo "END - Install $NAME"