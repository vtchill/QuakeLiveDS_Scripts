#!/bin/bash
# quakeinstall-root.sh - quake live dedicated server installation for root user.
# intended to be run on a fresh VPS/Dedicated Server, this script must be run under the root user.
# created by Thomas Jones on 29/09/15.
# Edited by Jesse Manning 07/11/215.

export QLDS_USER="steam"

if [ "$EUID" -ne 0 ]
  then echo "Please run under user 'root'."
  exit
fi
clear
echo "Updating 'apt-get'..."
apt-get update
clear
echo "Installing packages..."
apt-get -y install apache2 python3 python-setuptools lib32gcc1 curl nano build-essential python-dev unzip dos2unix mailutils wget lib32z1 lib32stdc++6 libc6
clear
#echo "Installing ZeroMQ library..."
# we use '--without-libsodium' because I encounter many problems with trying to configure with it.
# wget http://download.zeromq.org/zeromq-4.1.3.tar.gz; tar -xvzf zeromq-4.1.3.tar.gz; rm zeromq-4.1.3.tar.gz; cd zeromq*; ./configure --without-libsodium; make install; cd ..; rm -r zeromq*; easy_install pyzmq
clear
echo "Adding user $QLDS_USER..."
useradd -m $QLDS_USER
usermod -a -G sudo $QLDS_USER
chsh -s /bin/bash $QLDS_USER
clear
echo "Enter the password to use for $QLDS_USER account:"
passwd $QLDS_USER
clear
echo "Installing Supervisor..."
easy_install supervisor
clear
echo "All work done for 'root' user, please login to $QLDS_USER."
exit
