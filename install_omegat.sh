#!/bin/bash
#to run this script go into the folder where it is then run: ./install_omegat.sh
#
cd /tmp
wget -q --show-progress --content-disposition http://sourceforge.net/projects/omegat/files/OmegaT%20-%20Latest/OmegaT%205.3.0/OmegaT_5.3.0_Beta_Linux_64.tar.bz2/download
unp OmegaT_5.3.0_Beta_Linux_64.tar.bz2
cd OmegaT_5.3.0_Beta_Linux_64
./linux-install.sh
#https://wiki.apertium.org/wiki/Apertium-OmegaT
#https://www.youtube.com/watch?v=Sn6r2ph-8mE
cd /opt/omegat/plugins
sudo wget https://github.com/apertium/apertium-omegat/releases/download/v1.0/apertium-omegat.jar
cd $HOME
#cd /opt/omegat/OmegaT-default && java -jar OmegaT.jar
omegat