#!/bin/bash
#to run this script go into the folder where it is then run: ./install_fftffs.sh
#
set -eu
#
folder_name="fftffs"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress http://www.drpetter.se/files/fftuner.zip
wget -q --show-progress http://www.drpetter.se/thumbnails/fftuner1.gif
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip fftuner.zip
rm fftuner.zip
chmod +x fftffs.exe
cat << EOF | tee /home/$USER/programs_setup/$folder_name/start_fftffs.sh
#!/bin/bash
cd /home/$USER/programs_setup/$folder_name
wine fftffs.exe
EOF
chmod +x start_fftffs.sh
sudo apt install wine32 -y
#
cat << EOF | tee /home/$USER/.local/share/applications/fftffs.desktop
[Desktop Entry]
Name=fftffs
Comment=figure out the notes to his favorite songs
Exec=/home/xxUserxx/programs_setup/fftffs/start_fftffs.sh
Icon=/home/xxUserxx/programs_setup/fftffs/fftuner1.gif
Terminal=false
Type=Application
Categories=Application;Development;
Keywords=Music;Sound
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' fftffs.desktop
