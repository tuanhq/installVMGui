#!/bin/bash

if [ ! -x /usr/bin/wget ]
then
  sudo yum -y install wget 
fi
cd /tmp
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
sudo mkdir -p /opt/jdk
sudo tar -zxf jdk-8u111-linux-x64.tar.gz -C /opt/jdk

update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_111/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_111/bin/javac 100
update-alternatives --display java
update-alternatives --display javac
sudo yum install -y git
sudo yum install -y apache-maven

# install gui
yum -y groups install "GNOME Desktop"
#install firefox
cd /tmp
#wget https://ftp.mozilla.org/pub/firefox/releases/46.0/linux-x86_64/en-GB/firefox-46.0.tar.bz2
sudo tar -jxvf firefox-46.0.tar.bz2 -C /opt
#install chrome
sh ./install_chrome.sh -f
##copylib to 
systemctl set-default graphical.target 
sudo init 6







