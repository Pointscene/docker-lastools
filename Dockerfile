FROM ubuntu:14.04


RUN apt-get update && apt-get install -y \
    libtiff-dev libgeotiff-dev libgdal1-dev \
    libboost-system-dev libboost-thread-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev libboost-iostreams-dev \
    git cmake build-essential wget software-properties-common

RUN add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get install -y gcc-4.9 g++-4.9 && \
    cd /usr/bin && \
    rm gcc g++ cpp && \
    ln -s gcc-4.9 gcc && \
    ln -s g++-4.9 g++ && \
    ln -s cpp-4.9 cpp

WORKDIR /opt

RUN git clone https://github.com/LAStools/LAStools

WORKDIR /opt/LAStools

RUN git checkout master && \
    make all

ENV PATH /opt/LAStools/bin/:$PATH
