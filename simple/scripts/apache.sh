#!/bin/bash

## install web server with php

NAME="Web Server"
IP=$(hostname -I | awk '{print $2}')
LOG_FILE="/vagrant/logs/install_apache.log"
DEBIAN_FRONTEND="noninteractive"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install $NAME on "$IP

echo "=> [1]: Installing apache2 packages..."
apt-get install $APT_OPT \
  apache2 \
  php \
  libapache2-mod-php \
  >> $LOG_FILE 2>&1

echo "=> [2]: Installing php packages..."
apt-get install $APT_OPT \
  php-mysql \
  php-intl \
  php-curl \
  php-xmlrpc \
  php-soap \
  php-gd \
  php-json \
  php-cli \
  php-pear \
  php-xsl \
  php-zip \
  php-mbstring \
  >> $LOG_FILE 2>&1

echo "END - Install $NAME"
