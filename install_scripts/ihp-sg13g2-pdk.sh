#!/bin/bash
set -euxo pipefail

git clone https://github.com/IHP-GmbH/IHP-Open-PDK.git
cd IHP-Open-PDK/ihp-sg13g2/libs.tech
python3 xschem/install.py
