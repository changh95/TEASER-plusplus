FROM ubuntu:jammy 

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update -y && apt-get upgrade -y

RUN apt-get install build-essential -y && \
    apt-get install cmake -y && \
    apt-get install git -y && \
    apt-get install sudo -y && \
    apt-get install wget -y && \
    apt-get install ninja-build -y && \
    apt-get install software-properties-common -y && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    apt-get install -y ssh && \
    apt-get install -y gcc && \
    apt-get install -y g++ && \
    apt-get install -y gdb && \
    apt-get install -y cmake && \
    apt-get install -y rsync && \
    apt-get install -y tar && \
    apt-get install -y x11-utils && \
    apt-get install -y x11-apps && \
    apt-get install -y zip &&\
    apt-get install -y libeigen3-dev &&\
    apt-get install -y libboost-all-dev &&\
    apt-get clean
    
RUN git clone https://github.com/MIT-SPARK/TEASER-plusplus.git
RUN cd TEASER-plusplus && mkdir build && cd build &&\
    cmake .. && make -j &&\
    sudo make install &&\
    sudo ldconfig &&\
    cd .. && cd examples/teaser_cpp_ply && mkdir build && cd build &&\
    cmake .. && make -j

