#!/bin/bash
#to run this script go into the folder where it is then run: ./install_openmediavault.sh


echo "THIS IS NOT WORKING, not even beta.."
exit 1

#seams openmediavault needs nginx.. i do not like to install it on pi1..resources..

#https://www.elefacts.de/test-94-kleines_nas_fuer_den_guenstigen_24_7_einsatz_mit_dem_raspberry_pi_3
#https://forum.openmediavault.org/index.php?thread/25062-install-omv5-on-debian-10-buster/
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install resolvconf -y
sudo apt-get install moreutils -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7E7A6C592EF35D13
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 24863F0C716B980B
#echo -e "deb http://packages.openmediavault.org/public arrakis main" | sudo sponge /etc/apt/sources.list.d/openmediavault.list
echo -e "deb https://packages.openmediavault.org/public usul main
# deb https://downloads.sourceforge.net/project/openmediavault/packages usul main
## Uncomment the following line to add software from the proposed repository.
# deb https://packages.openmediavault.org/public usul-proposed main
# deb https://downloads.sourceforge.net/project/openmediavault/packages usul-proposed main
## This software is not part of OpenMediaVault, but is offered by third-party
## developers as a service to OpenMediaVault users.
# deb https://packages.openmediavault.org/public usul partner
# deb https://downloads.sourceforge.net/project/openmediavault/packages usul partner" | sudo sponge /etc/apt/sources.list.d/openmediavault.list
sudo apt-get update -y


#export LANG=C.UTF-8
#export DEBIAN_FRONTEND=noninteractive
#export APT_LISTCHANGES_FRONTEND=none
#wget -O "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" https://packages.openmediavault.org/public/archive.key
#apt-key add "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc"
#apt-get update
#apt-get --yes --auto-remove --show-upgraded \
#    --allow-downgrades --allow-change-held-packages \
#    --no-install-recommends \
#    --option Dpkg::Options::="--force-confdef" \
#    --option DPkg::Options::="--force-confold" \
#    install openmediavault-keyring openmediavault

# Populate the database.
#omv-confdbadm populate

# Display the login information.
#cat /etc/issue


sudo apt-get install openmediavault-keyring -y #postfix -y  #run not in script.. cause request things for mailsever postfix..chose config none
sudo apt-get update -y
sudo apt-get install openmediavault -y  #reqeuts dhcp usage while install..
sudo omv-initsystem
sudo usermod -aG ssh pi
sudo reboot

#wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash





