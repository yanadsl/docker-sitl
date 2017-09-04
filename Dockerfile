FROM ubuntu:16.04
MAINTAINER yan yanadsl@gmail.com

RUN apt-get update && apt-get install -y \
    python-matplotlib \
    python-serial \
    python-wxgtk3.0 \
    python-wxtools \
    python-lxml \
    python-scipy \
    python-opencv \
    ccache \
    gawk \
    git \
    python-pip \
    python-pexpect

RUN pip install future pymavlink MAVProxy

ENV PATH=$PATH:/ardupilot/Tools/autotest:/jsbsim/src:/usr/lib/ccache

RUN git clone git://github.com/ArduPilot/ardupilot.git && \
    cd ardupilot \
    && git submodule update --init --recursive \
    && cd ArduCopter \
    && timeout 1200 sim_vehicle.py -w

WORKDIR /ardupilot/ArduCopter

ENTRYPOINT ["sim_vehicle.py", "-j4"]

EXPOSE 5762
