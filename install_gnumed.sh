#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gnumed.sh

set -eu
#
#
if [ -d "/home/$USER/programs_setup/gnumed" ]; then
 #cd /home/$USER
 #rm -rf /home/$USER/programs_setup/gnumed
 #echo "removed gnumed"
else
 #mkdir -p /home/$USER/programs_setup/
 #cd /home/$USER/programs_setup/
fi
#
#sudo apt-get install postgresql postgresql-client gnumed-server -y
#sudo ln -s /usr/bin/python3 /usr/bin/python
#sudo gm-bootstrap_server
#sudo apt-get install gnumed-client -y
#gnumed

#cd /tmp
#wget https://www.gnumed.de/downloads/client/gm-install_client_locally.sh
#chmod +x gm-install_client_locally.sh
#wget http://www.gnumed.de/downloads/client/1.8/gnumed-client.1.8.4.tgz
#./gm-install_client_locally.sh 1.8 1.8.4 installdeps