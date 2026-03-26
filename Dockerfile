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
    libjpeg9 libjpeg9-dev

COPY ./install.sh /install_script/install.sh
RUN chmod +x /install_script/install.sh && /install_script/install.sh
