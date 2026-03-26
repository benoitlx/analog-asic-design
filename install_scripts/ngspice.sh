#!/bin/bash
set -euxo pipefail
  
git clone https://github.com/danchitnis/ngspice-sf-mirror.git
cd ngspice-sf-mirror
./autogen.sh
mkdir release
cd release
../configure --with-x --enable-cider
make
make install
