#!/bin/bash

## install base system

## Script system de base commun à toutes les VMS

NAME="Base System"
IP=$(hostname -I | awk '{print $2}')
LOG_FILE="/vagrant/logs/install_sys.log"
DEBIAN_FRONTEND=noninteractive
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

#Utilisateur a créer (si vide pas de création)
USER="joshua"
PASSWORD="joshua"

echo "START - Install $NAME on "$IP

echo "=> [1]: Installing base packages..."
apt-get update $APT_OPT >> $LOG_FILE 2>&1
apt-get install $APT_OPT \
  wget \
  gnupg \
  unzip \
  git \
  >> $LOG_FILE 2>&1

echo "=> [2]: Installing telnet packages..."
apt-get install $APT_OPT telnetd >> $LOG_FILE 2>&1

echo "=> [3]: Installing ftp packages..."
apt-get install $APT_OPT vsftpd >> $LOG_FILE 2>&1

echo "=> [4]: Debian repositories configuration"
# Ajout de contrib et non-free pour les depots
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
# Ajout de la ligne pour le proxy ESEO mais descativé par défaut
echo "#Acquire::http::Proxy \"http://scully.eseo.fr:9999\";" >> /etc/apt/apt.conf
# Pour avoir le clavier en français dans la console VB
# Actif au prochain redémarrage
# sed -i 's/XKBLAYOUT=\"us\"/XKBLAYOUT=\"fr\"/g' /etc/default/keyboard
# sed -i 's/XKBVARIANT=\"\"/XKBVARIANT=\"latin9\" /g' /etc/default/keyboard
/usr/bin/localectl set-keymap fr

# ajout utilisateur et autres
if [ -n "$USER" ] ;then
  echo "=> [5]: Creating user "$USER
  adduser $USER --disabled-password --gecos "" >> LOG_FILE 2>&1
  echo "$USER:$PASSWORD"|chpasswd >> LOG_FILE 2>&1
fi
echo "END - Install $NAME"
