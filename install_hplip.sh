#!/bin/bash
#to run this script go into the folder where it is then run: ./install_hplip.sh
sudo apt-get install hplip -y
echo "now:
1. plugin the printer
2. sudo hp-setup -i
3. follow the steps
4. if it fails remove hplip and run latest from: https://developers.hp.com/hp-linux-imaging-and-printing/gethplip
(example in this script)"

#wget http://netcologne.dl.sourceforge.net/project/hplip/hplip/3.20.3/hplip-3.20.3.run
#chmod +x hplip-3.20.3.run
#./hplip-3.20.3.run

#sudo apt install hplip-gui -y

echo "4.1 hp device manager: wireless wifi setup
4.2 default password wifidirect: 12345678
4.3 http://192.168.223.1/
4.4 add rpinter network printer driverless ipp
4.5 same for wlan setup, after connected to wlan over wifidirect"
