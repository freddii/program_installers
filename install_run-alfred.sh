#!/bin/bash
mkdir /tmp/$$ ; cd /tmp/$$
wget -q --show-progress https://raw.githubusercontent.com/derkomai/alfred/master/alfred.py && python3 alfred.py