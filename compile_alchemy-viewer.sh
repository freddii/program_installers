#!/bin/bash

#This script been created on Debian trixie (sid) 2023-08-24 - run me in a new created directory.
#Maybe some changes are needed, depends on alchemy-next requirements/changes and your system
#Also check which branch you want to compile, this script is for the latest active branch currently
#Most recommendations are to check .gitlab-ci.yml file in alchemy repository


sudo apt install -y libglu1-mesa-dev libgl-dev libegl1-mesa-dev libgles2-mesa-dev libvulkan-dev libasound2-dev \
    libpulse-dev meson autoconf autoconf-archive automake autotools-dev libtool gettext ninja-build \
    python3-wheel pipenv python3-venv build-essential git mercurial curl wget nasm gnutls-bin groff libudev-dev libdbus-1-dev \
    libibus-1.0-dev fcitx-libs-dev libx11-dev x11proto-dev libxext-dev libxrender-dev libxi-dev libxss-dev libxinerama-dev libxkbcommon-dev \
    libxrandr-dev libxcursor-dev libxt-dev libxv-dev libxxf86vm-dev libice-dev libwayland-dev libwayland-egl-backend-dev wayland-protocols \
    libinput-dev libcunit1-dev libxml2-utils curl openssl wget libtimedate-perl libfreetype-dev libgtk-3-dev libglib2.0-dev libsystemd-dev \
    libgdk-pixbuf2.0-dev libvlc-dev libncurses-dev gperf bison flex fakeroot cdbs elfutils devscripts locales liblzma-dev chrpath \
    libnspr4 libnspr4-dev libnss3 libnss3-dev graphviz cmake gcc-10 g++-10 libfontconfig1-dev


#Check if alchemy-next already exists
if [ -d "alchemy-next" ]; then
    echo "Alchemy already exists. Updating..."
    cd alchemy-next
    git pull
    cd ..
else
    echo "Cloning Alchemy..."
    #Clone Alchemy in this directory
    git clone https://git.alchemyviewer.org/alchemy/alchemy-next.git
fi


#cd alchemy-next
#Save alchemy-next directory path
ALCHEMY_DIR=$(pwd)/alchemy-next


if [ -d ".venv" ]; then
    echo "Virtual environment already exists. Updating..."
    cd .venv/bin
    source activate
    
    cd ..
else
    echo "Creating virtual environment..."
    #Create virtual environment
    python3 -m venv .venv
    cd .venv
    source bin/activate
    
    cd ..
fi


pip3 install --upgrade llbase autobuild certifi sentry-cli cmake ninja
#cd to alchemy-next directory
cd $ALCHEMY_DIR

#Edit configure & build lines for your needs
#Copy configure and build lines to your own script better later
autobuild configure -c ReleaseOS -A64 -- -DUSE_LTO=OFF -DLL_TESTS="${ENABLE_TESTS}" -DDISABLE_FATAL_WARNINGS=ON -DREVISION_FROM_VCS=FALSE -DCOMPRESS_DEBUG=ON
autobuild build -c ReleaseOS -A64 --no-configure
echo "Done - run client: ./alchemy-next/build-linux-64/newview/packaged/alchemy"

#TODO: Create flatpak package for alchemy-next for isolating it from system
