FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq -y update \
    && apt-get install -qq -y \
    libtiff5 \
    libgeotiff5 \
    libgdal26 \
    libboost-system1.71.0 \
    libboost-thread1.71.0 \
    libboost-filesystem1.71.0 \
    libboost-program-options1.71.0 \
    libboost-regex1.71.0 \
    libboost-iostreams1.71.0 \
    libtiff-dev \
    libgeotiff-dev \
    libgdal-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-iostreams-dev \
    git \
    cmake \
    g++ \
    && mkdir /src \
    && cd /src \
    && git clone https://github.com/LAStools/LAStools \
    && cd LAStools \
    && make all \
    && cd bin \
    && install lasinfo laszip lasprecision las2txt txt2las las2las lasdiff lasmerge /usr/local/bin \
    && cd / \
    && rm -fr /src \
    && apt-get remove -qq -y \
    libtiff-dev \
    libgeotiff-dev \
    libgdal-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-iostreams-dev \
    git \
    cmake \
    g++ \
    && apt-get autoremove -qq -y \
    && rm -rf /var/lib/apt/lists/*
