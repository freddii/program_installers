#!/bin/bash
#to run this script go into the folder where it is then run: ./install_blender-stable-addons.sh
cd /home/$USER
#
set -eu
#version="2.83"
version="$(wget -q $(wget -q https://www.blender.org/download/ -O - | egrep 'https://[0-9,a-z,A-Z,/_.-]{1,100}blender-[0-9,a-z,A-Z,_.-]{1,50}-linux64.tar.xz' -o | head -1 ) -O - | egrep 'https://.*/.*/blender-.*-linux64.tar.xz' -o | egrep '[0-9]{1,1}\.[0-9]{1,3}' -o | head -1)"
#echo $version #exit
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/blender-osm-release" ]; then
  cd /tmp
  wget -q --show-progress https://github.com/vvoovv/blender-osm/archive/release.zip
  unzip -q -q release.zip
  rm /tmp/release.zip
  cp -r /tmp/blender-osm-release $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/blender-osm-release
fi
#
#blender install from file /home/$USER/programs_setup/blender-stable/$version/scripts/addons/blender_knots-master/knot_plugin_280.py
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/blender_knots-master" ]; then
  cd /tmp
  wget -q --show-progress https://github.com/johnhw/blender_knots/archive/master.zip
  unzip -q master.zip
  rm /tmp/master.zip
  cp -r /tmp/blender_knots-master $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/blender_knots-master
fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/Maze Generator" ]; then
  cd /tmp
  wget -q --show-progress https://github.com/Gorgious56/MazeGenerator/releases/download/0.3.0/Blender-MazeGenerator-0.3.0.zip
  unzip -q Blender-MazeGenerator-0.3.0.zip
  rm /tmp/Blender-MazeGenerator-0.3.0.zip
  cp -r /tmp/Maze\ Generator $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/Maze\ Generator
fi
#
#https://youtu.be/VTFvIJ_9vbw
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/Real Snow" ]; then
  cd /tmp
  #https://github.com/macio97/Real-Snow/archive/master.zip
  wget -q --show-progress https://3d-wolf.com/products/download/Real%20Snow.zip
  unzip -q Real\ Snow.zip
  rm /tmp/Real\ Snow.zip
  cp -r /tmp/Real\ Snow $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/Real\ Snow
fi
#
#Modelling >Mesh>Maze mesh selection
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/mesh_maze-master" ]; then
  cd /tmp
  wget -q --show-progress https://github.com/elfnor/mesh_maze/archive/master.zip
  unzip -q master.zip
  rm /tmp/master.zip
  cp -r /tmp/mesh_maze-master $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/mesh_maze-master
fi
#
#https://www.youtube.com/watch?v=jNXBYI-WPU4
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/Modeling-Cloth-2_8-master" ]; then
  cd /tmp
  wget -q --show-progress https://github.com/the3dadvantage/Modeling-Cloth-2_8/archive/master.zip
  unzip -q master.zip
  rm /tmp/master.zip
  cp -r /tmp/Modeling-Cloth-2_8-master $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/Modeling-Cloth-2_8-master
fi
#
#
#https://www.youtube.com/watch?v=rKSWt8CdU7A
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/building_tools" ]; then
  cd /tmp
  #wget https://github.com/ranjian0/building_tool/releases/download/v1.0.0/building_tool-v1.0.0.zip
  wget -q --show-progress https://github.com/ranjian0/building_tools/releases/download/v1.0.2/building_tools-v1.0.2.zip
  unzip -q building_tools-v1.0.2.zip
  rm /tmp/building_tools-v1.0.2.zip
  cp -r /tmp/building_tools $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/building_tools
fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/MB-Lab-master" ]; then
  #rm -r $HOME/programs_setup/blender-stable/*/scripts/addons/MB-Lab-master
  cd /tmp
  wget -q --show-progress https://github.com/animate1978/MB-Lab/archive/master.zip
  unzip -q master.zip
  rm /tmp/master.zip
  cp -r /tmp/MB-Lab-master $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/MB-Lab-master
fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/object_fracture_crack_ex" ]; then
  cd /tmp
  wget -q --show-progress https://github.com/squarednob/crack_it/raw/master/object_fracture_crack_ex.zip
  unzip -q object_fracture_crack_ex.zip
  rm /tmp/object_fracture_crack_ex.zip
  cp -r /tmp/object_fracture_crack_ex $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -r /tmp/object_fracture_crack_ex
fi
#
#
#if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/quicktree" ]; then
#  #mkdir -p ~/.config/blender/2.77/scripts/addons/
#  #cd $HOME/programs_setup/blender-stable/*/scripts/addons/
#  git clone https://github.com/wolfgangp/quicktree.git $HOME/programs_setup/blender-stable/$version/scripts/addons/quicktree
#fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/retopoflow" ]; then
  git clone https://github.com/CGCookie/retopoflow.git $HOME/programs_setup/blender-stable/$version/scripts/addons/retopoflow
fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/bookGen" ]; then
  cd /tmp
  git clone https://github.com/oweissbarth/bookGen.git
  cp -r /tmp/bookGen/bookGen $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -rf /tmp/bookGen
fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/ch_trees" ]; then
  cd /tmp
  git clone https://github.com/friggog/tree-gen.git
  cp -r /tmp/tree-gen/ch_trees $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -rf /tmp/tree-gen
fi
#
#
if [ ! -d "$HOME/programs_setup/blender-stable/$version/scripts/addons/BlenderGIS" ]; then
  cd /tmp
  git clone --depth=1 https://github.com/domlysz/BlenderGIS.git
  cp -r /tmp/BlenderGIS $HOME/programs_setup/blender-stable/*/scripts/addons/
  rm -rf /tmp/BlenderGIS
fi
#



