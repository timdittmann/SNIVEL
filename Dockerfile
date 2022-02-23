FROM ubuntu:20.04
LABEL maintainer="UNAVCO"

RUN apt-get update && \
    apt-get install -y python3-pip unzip wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /SNIVEL

RUN pip3 install georinex numpy==1.21 scipy urllib3 hatanaka wget obspy
# numpy version : https://github.com/obspy/obspy/issues/2983

COPY . .
