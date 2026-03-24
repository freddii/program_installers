#!/bin/bash
#to run this script go into the folder where it is then run: ./install_thonny.sh
#
sudo apt install thonny -y
cd $HOME
mkdir powerful_python
cd powerful_python
python3 -m venv my_venv
source my_venv/bin/activate
pip install matplotlib
deactivate
echo "click on the three dots at the bottom right and choose 'Configure interpreter'
then right to 'python executeable' on the three dots and choose
$HOME/powerful_python/my_venv/bin/python3"
exit
#
cd /tmp
#wget https://bitbucket.org/plas/thonny/downloads/thonny-3.0.5.bash
#wget https://bitbucket.org$(wget https://bitbucket.org/plas/thonny/downloads/ -O - | egrep '/plas/thonny/downloads/thonny-[0-9.]{1,20}.bash' -o | head -1) 
wget -q --show-progress https://github.com/thonny/thonny/releases/download/v3.3.0b2/thonny-3.3.0b2.bash
chmod +x thonny-*.bash
./thonny-*.bash
