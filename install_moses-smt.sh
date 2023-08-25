#!/bin/bash
#to run this script go into the folder where it is then run: ./install_moses-smt.sh
#
#based on: https://achrafothman.net/site/how-to-install-moses-statistical-machine-translation-in-ubuntu/
#tested on 18.04
#
set -eu
#
if [ -d "/home/$USER/programs_setup/moses-smt" ]; then
  #cd /home/$USER/programs_setup/rtl_433/build
  #sudo make uninstall
  #cd /home/$USER/
  rm -rf /home/$USER/programs_setup/moses-smt
fi
sudo apt-get install \
   git \
   subversion \
   make \
   libtool \
   gcc \
   g++ \
   libboost-dev \
   tcl-dev \
   tk-dev \
   zlib1g-dev \
   libbz2-dev \
   python-dev \
   libicu-dev \
   libunistring-dev unp -y
#
sudo apt-get install build-essential git-core pkg-config automake libtool wget zlib1g-dev python-dev libbz2-dev -y
sudo apt-get install libsoap-lite-perl -y
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/moses-smt/mosesdecoder.git
git clone https://github.com/moses-smt/giza-pp.git
cd giza-pp
make
#
cd ../mosesdecoder
mkdir tools
cp ../giza-pp/GIZA++-v2/GIZA++ ../giza-pp/GIZA++-v2/snt2cooc.out ../giza-pp/mkcls-v2/mkcls tools
cd ..
#
wget -q --show-progress https://kumisystems.dl.sourceforge.net/project/irstlm/irstlm/irstlm-5.80/irstlm-5.80.08.tgz
unp irstlm-5.80.08.tgz
rm irstlm-5.80.08.tgz
mkdir irstlm
cd irstlm-5.80.08
cd trunk
./regenerate-makefiles.sh
./configure --prefix=$HOME/irstlm
make install #failed...
cd ..
cd ..


