#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sketch-simplification.sh
#
set -eu
#
sudo apt-get install python3 python3-venv python3-pip -y
#
folder_name="sketch-simplification"
#
  mkdir -p /home/$USER/programs_setup
  cd /home/$USER/programs_setup
  python3 -m venv sketch-simplification
  cd sketch-simplification
  source bin/activate
#
if [ ! -d "/home/$USER/programs_setup/$folder_name/sketch_simplification" ]; then
  git clone https://github.com/bobbens/sketch_simplification
  cd sketch_simplification
  bash download_models.sh
  cd ..
fi
  cd sketch_simplification
  python3 -m pip install numpy
  python3 -m pip install torchvision
  python3 -m pip install torch==0.4.1
  python3 -m pip install pillow
#
#cd /home/$USER/programs_setup/sketch-simplification/sketch_simplification/
#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $HOME/Desktop/input.jpg --out $HOME/Desktop/out_roughpencil1.png --model model_pencil1.t7
#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $HOME/Desktop/input.jpg --out $HOME/Desktop/out_roughpencil2.png --model model_pencil2.t7
#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $HOME/Desktop/input.jpg --out $HOME/Desktop/out_roughmse.png --model model_mse.t7
#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $HOME/Desktop/input.jpg --out $HOME/Desktop/out_roughgan.png --model model_gan.t7
