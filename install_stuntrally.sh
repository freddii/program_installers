#!/bin/bash
#to run this script go into the folder where it is then run: ./install_stuntrally.sh
#based on http://stuntrally.tuxfamily.org/wiki/doku.php?id=compile
#
set -eu
#
show() {
  echo "##################################################################"
  echo "$1"
  echo "##################################################################"
}

show "install dependencies"

sudo apt-get update
sudo apt-get install --assume-yes git cmake g++

# boost
sudo apt-get install --assume-yes libboost-wave-dev libboost-system-dev libboost-filesystem-dev libboost-thread-dev

# graphics
sudo apt-get install --assume-yes libogre-1.9-dev libmygui-dev libsdl2-dev

# sound
sudo apt-get install --assume-yes libogg-dev libvorbis-dev libenet-dev libopenal-dev

# bullet
sudo apt-get install --assume-yes libbullet-dev libbullet-extras-dev

show "get latest sourcecode"
folder_name="stuntrally"

#dpkg -l | grep -qw stuntrally || sudo apt-get purge stuntrally -y
if [ ! $(dpkg-query -W -f='${Status}' stuntrally 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get purge stuntrally;
fi

if [ -d "/usr/local/share/games/stuntrally" ]; then
  cd /home/$USER/
  sudo rm -f /usr/local/bin/stuntrally
  sudo rm -f /usr/local/bin/sr-editor
  sudo rm -f /usr/local/share/applications/stuntrally.desktop
  sudo rm -f /usr/local/share/applications/sr-editor.desktop
  sudo rm -f /usr/local/share/icons/hicolor/64x64/apps/stuntrally.png
  sudo rm -f /usr/local/share/icons/hicolor/64x64/apps/sr-editor.png
  sudo rm -rf /usr/local/share/games/stuntrally
fi
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/programs_setup/$folder_name
  git pull
  rm -rf /home/$USER/programs_setup/$folder_name/build
else
  mkdir -p /home/$USER/programs_setup
  cd /home/$USER/programs_setup
  git clone --depth=1 git://github.com/stuntrally/stuntrally.git stuntrally
  cd stuntrally/data
  git clone --depth=1 git://github.com/stuntrally/tracks.git tracks
  cd ../..
fi
#

show "compile code"

cd /home/$USER/programs_setup/
cd stuntrally   # Change directory to the game sources
mkdir build     # Create a build directory
cd build        # Change to the build directory

cmake ..        # Create build files
#
minnum=1
cpunum=$(expr $(nproc --all) - 1)
echo "number of cpus less one $cpunum"
usenum=1

if (( cpunum > minnum )); then
	usenum=$cpunum
    echo "using $usenum cpus."
    
else
    echo "using only $usenum cpu."
fi
#
#make -j4        # Compile using 4 threads (change to your number of CPUs)
make -j$usenum
#
cd /tmp
wget -q --show-progress http://ftp.de.debian.org/debian/pool/main/c/checkinstall/checkinstall_1.6.2-4_amd64.deb
sudo dpkg -i checkinstall_1.6.2-4_amd64.deb
rm checkinstall_1.6.2-4_amd64.deb

cd $HOME/programs_setup/stuntrally/build
#checkinstall --install=no --pkgname stuntrally --nodoc
checkinstall -y --install=no --pkgname stuntrally --nodoc --fstrans --exclude /home
sudo dpkg -i stuntrally_*_amd64.deb
#dpkg -r stuntrally
#sudo apt purge stuntrally

# Optionally install everything (you can run without installing)
# sudo make install # might need administrator privileges

#sudo rm /usr/local/bin/stuntrally
#sudo rm /usr/local/bin/sr-editor
#sudo rm /usr/local/share/applications/stuntrally.desktop
#sudo rm /usr/local/share/applications/sr-editor.desktop
#sudo rm /usr/local/share/icons/hicolor/64x64/apps/stuntrally.png
#sudo rm /usr/local/share/icons/hicolor/64x64/apps/sr-editor.png
#sudo rm -r /usr/local/share/games/stuntrally
