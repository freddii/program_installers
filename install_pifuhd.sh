#!/bin/bash
#to run this script go into the folder where it is then run: ./install_pifuhd.sh

set -eu

sudo apt-get install freeglut3-dev -y
git clone https://github.com/facebookresearch/pifuhd
cd pifuhd
sh ./scripts/download_trained_model.sh
sh ./scripts/demo.sh