#!/bin/bash
#to run this script go into the folder where it is then run: ./install_pipx.sh

set -eu
#
#
python3 -m pip install --user pipx
python3 -m pipx ensurepath

pipx run cowsay moooo