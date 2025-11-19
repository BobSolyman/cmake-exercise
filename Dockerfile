FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

# Build yaml-cpp v0.6.3 from source
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz && \
    tar -xzf yaml-cpp-0.6.3.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    cmake .. && make && make install && \
    cd ../.. && rm -rf yaml-cpp-*

# Add library path
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /cmake-exercise
COPY . .
CMD ["/bin/bash"]