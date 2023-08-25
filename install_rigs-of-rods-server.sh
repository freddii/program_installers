#!/bin/bash
#to run this script go into the folder where it is then run: ./install_install_rigs-of-rods-server.sh
# https://github.com/RigsOfRods/ror-server
# https://github.com/RigsOfRods/rigs-of-rods/wiki/Compile-(Linux)
# https://www.openhub.net/p/rigs-of-rods/contributors?page=1
set -eu
#
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
#
folder_name="rigs-of-rods-server"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
wget -q --show-progress -O rorserver-rornet241-linux.zip http://forum.rigsofrods.org/resources/rigs-of-rods-multiplayer-server-for-0-4-8-0-linux.208/download
unzip rorserver-rornet241-linux.zip -d rorserver-241
cd rorserver-241
chmod +x rorserver
#
#ln -s /home/$USER/programs_setup/$folder_name/rorserver-241/rorserver /home/$USER/.local/bin/rorserver
touch /home/$USER/.local/bin/rorserver
chmod +x /home/$USER/.local/bin/rorserver
cat << EOF | tee /home/$USER/.local/bin/rorserver
#!/bin/bash
cd /home/$USER/programs_setup/$folder_name/rorserver-241/
./rorserver "\$@"
EOF
#
echo "###############################################################"
echo "TO RUN IT:" 
echo "rorserver -name Private_Server -port 12000 -lan -fg"
echo " "
echo "OR HAVE A LOOK AT:"
echo "https://github.com/RigsOfRods/ror-server"
echo "###############################################################"
#