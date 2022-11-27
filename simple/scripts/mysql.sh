#!/bin/bash

## install mysql

NAME="MySQL"
IP=$(hostname -I | awk '{print $2}')
LOG_FILE="/vagrant/logs/install_mysql.log"
DEBIAN_FRONTEND="noninteractive"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install $NAME on "$IP

echo "=> [1]: Installing mariadb packages ..."
apt-get install $APT_OPT \
	mariadb-server \
	mariadb-client \
   >> $LOG_FILE 2>&1

echo "END - Install $NAME"