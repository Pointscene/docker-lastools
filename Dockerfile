FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    libtiff-dev libgeotiff-dev libgdal-dev \
    libboost-system-dev libboost-thread-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev libboost-iostreams-dev \
    git cmake build-essential wget software-properties-common

WORKDIR /opt

RUN git clone https://github.com/LAStools/LAStools

WORKDIR /opt/LAStools

RUN git checkout master && \
    make all

ENV PATH /opt/LAStools/bin/:$PATH
