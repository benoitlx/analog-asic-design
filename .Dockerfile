FROM ubuntu:latest AS xschem

RUN apt-get update && apt-get -y install \
    git build-essential \
    libx11-6 libx11-dev \
    libxrender1 libxrender-dev \
    libxcb1 libx11-xcb-dev \
    libcairo2 libcairo2-dev \
    tcl8.6 tcl8.6-dev \
    tk8.6 tk8.6-dev \
    flex bison \
    libxpm4 libxpm-dev \
    libjpeg9 libjpeg9-dev \
    xterm
RUN apt-get -y install \
    autoconf automake libtool \
    libxaw7 libxaw7-dev \
    libreadline-dev

COPY install_scripts/xschem.sh /tmp/xschem.sh
COPY install_scripts/ngspice.sh /tmp/ngspice.sh
COPY install_scripts/ihp-sg13g2-pdk.sh /tmp/ihp-sg13g2-pdk.sh

ENV PDK=ihp-sg13g2
ENV PDK_ROOT=/IHP-Open-PDK
ENV PDKPATH=$PDK_ROOT/$PDK

ENV STD_CELL_LIBRARY=sg13g2_stdcell
ENV SPICE_USERINIT_DIR=$PDKPATH/libs.tech/ngspice
ENV KLAYOUT_PATH=$PDKPATH/libs.tech/klayout:$PDKPATH/libs.tech/klayout/tech

RUN chmod +x /tmp/xschem.sh && /tmp/xschem.sh
RUN chmod +x /tmp/ngspice.sh && /tmp/ngspice.sh
RUN chmod +x /tmp/ihp-sg13g2-pdk.sh && /tmp/ihp-sg13g2-pdk.sh

