#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gogs-pi.sh
#
echo "gogs is made by google..exit script :)"
exit
#based on:
#https://linuxize.com/post/how-to-install-and-configure-gogs-on-ubuntu-18-04/
#
sudo apt-get update -y
sudo apt install sqlite3 -y
sudo apt install git -y
sudo adduser --system --group --disabled-password --shell /bin/bash --home /home/git --gecos 'Git Version Control' git
wget -q --show-progress https://dl.gogs.io/0.11.79/gogs_0.11.79_raspi2_armv6.zip -P /tmp
sudo unzip /tmp/gogs_0.11.79_raspi2_armv6.zip -d /home/git
sudo chown -R git: /home/git/gogs
sudo cp /home/git/gogs/scripts/systemd/gogs.service /etc/systemd/system/
sudo systemctl start gogs
sudo systemctl enable gogs
#sudo systemctl status gogs #to check correct status of gogs
o http://raspberrypi.fritz.box:3000
# Database type:sqlite3
# Path: /home/git/gogs/gogs.db
# application name: Gogs Pi
# repository root path: /home/git/gogs-ropositories
# run user: git
# domain: raspberrypi.fritz.box
# ssh port: 22
# http port: 3000
# application url: http://raspberrypi.fritz.box:3000/
# log path: home/git/gogs/log

#to upgrade:
#sudo systemctl stop gogs
#more on https://linuxize.com/post/how-to-install-and-configure-gogs-on-ubuntu-18-04/