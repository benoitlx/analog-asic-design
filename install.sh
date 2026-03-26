#!/bin/bash
set -euxo pipefail
  
git clone https://github.com/StefanSchippers/xschem.git xschem-src
cd xschem-src
./configure
make
make install
