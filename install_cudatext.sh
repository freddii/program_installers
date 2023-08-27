#!/bin/bash
#to run this script go into the folder where it is then run: ./install_cudatext.sh
#
set -eu
#
#cd /home/$USER
#wget https://sourceforge.net/projects/cudatext/files/release/Linux/cudatext_1.63.0.0-1_gtk2_amd64.deb/download
#wget https://netcologne.dl.sourceforge.net/project/cudatext/release/Linux/cudatext_1.61.0.0-1_gtk2_amd64.deb
wget -O cudatext_amd64.deb https://master.dl.sourceforge.net/project/cudatext/release/1.197.0.2/cudatext_1.197.0.2-1_gtk2_amd64.deb
#wget -O cudatext_amd64.deb $(wget https://sourceforge.net/projects/cudatext/rss?path=/release/Linux -O - | egrep 'https:/.*/.*/cudatext_.*gtk2_amd64.deb/download' -o | head -1)
#wget -O cudatext_amd64.deb $(wget https://sourceforge.net/p/cudatext/activity/feed -O - | egrep 'https:/.*/.*/cudatext_.*gtk2_amd64.deb/download' -o | head -1)
#wget -O cudatext_amd64.deb $(wget https://www.fosshub.com/CudaText.html  -O - | egrep 'https://www.fosshub.com/CudaText.html\?dwl=cudatext_[0-9,_.-]{1,20}_gtk2_amd64.deb' -o | head -1)
sudo dpkg -i cudatext_amd64.deb
sudo apt-get install -f -y
rm cudatext_amd64.deb
#
#
folder_name="cudatext"
#
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/$folder_name
#  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
#fi
#
#mkdir -p /home/$USER/programs_setup/$folder_name
#cd /home/$USER/programs_setup/$folder_name
#
#git clone https://github.com/Alexey-T/CudaText_up
#cd CudaText_up
#./cudaup.sh -g -m

#echo "simply download the deb file from:
#https://www.fosshub.com/CudaText.html
#https://sourceforge.net/projects/cudatext/files/release/
#Then install it with:
#cd $HOME/Downloads
#sudo dpkg -i cudatext_*.deb"

echo "plugins > addon manager > install from github:
https://github.com/OlehL/cuda_differ
https://github.com/CudaText-addons/cuda_terminal
https://github.com/OlehL/cuda_plain_tasks
https://github.com/CudaText-addons/cuda_calc_expr"
