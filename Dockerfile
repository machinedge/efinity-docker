# --------------------------------------------------------
# Copyright (c) 2024 MachinEdge LLC
#
# Author:
#   shyam@machineedge.io
#
# Description:
#  Dockerfile for Efinity 2023.2
# --------------------------------------------------------

# arguments
ARG EFINITY_VERSION="2023.2"

# Use Ubuntu 22.04 LTS as base image
FROM ubuntu:22.04


# set to non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    cmake \
    make \
    tar \
    gzip \
    unzip \
    libxcb-xinerama0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libdbus-1-3 \
    python3.11 \
    python3-pip \
    python3.11-dev \
    python3.11-venv

COPY ./requirements.txt /tmp/requirements.txt


# Copy the efinity directory to the container
COPY ./efinity /efinity

# Install python packages
COPY ./efinity/2023.2/lib/python3.11/site-packages/devicedb /usr/lib/python3.11/site-packages/devicedb
COPY ./efinity/2023.2/lib/python3.11/site-packages/devicedb-0.0.1.dist-info /usr/lib/python3.11/site-packages/devicedb-0.0.1.dist-info
COPY ./efinity/2023.2/lib/python3.11/site-packages/netlistdb /usr/lib/python3.11/site-packages/netlistdb
COPY ./efinity/2023.2/lib/python3.11/site-packages/netlistdb-1.1.dist-info /usr/lib/python3.11/site-packages/netlistdb-1.1.dist-info
COPY ./efinity/2023.2/lib/python3.11/site-packages/netview /usr/lib/python3.11/site-packages/netview
COPY ./efinity/2023.2/lib/python3.11/site-packages/netview-1.0.dist-info /usr/lib/python3.11/site-packages/netview-1.0.dist-info
COPY ./efinity/2023.2/lib/python3.11/site-packages/projectdb /usr/lib/python3.11/site-packages/projectdb
COPY ./efinity/2023.2/lib/python3.11/site-packages/projectdb-1.0.dist-info /usr/lib/python3.11/site-packages/projectdb-1.0.dist-info

RUN pip3 install -r /tmp/requirements.txt

# set container env variables
ENV EFINITY_HOME="/efinity/2023.2"

ENV EFXPT_HOME="${EFINITY_HOME}/pt"
ENV EFXPGM_HOME="${EFINITY_HOME}/pgm"
ENV EFXDBG_HOME="${EFINITY_HOME}/debugger"
ENV EFXIPM_HOME="${EFINITY_HOME}/ipm"
ENV EFXIPMGR_HOME="${EFINITY_HOME}/ipm/bin/ip_manager"
ENV EFXIPPKG_HOME="${EFINITY_HOME}/ipm/bin/ip_packager"
ENV EFXSVF_HOME="${EFINITY_HOME}/debugger/svf_player"

ENV QT_LOGGING_CONF="${EFINITY_HOME}/bin/lc.ini"
ENV QT_PLUGIN_PATH="${EFINITY_HOME}/lib/plugins"

ENV PATH="${EFINITY_HOME}/bin:${EFINITY_HOME}/scripts:${EFXPGM_HOME}/bin:${EFXDBG_HOME}/bin:${EFXSVF_HOME}/bin:${EFXIPM_HOME}/bin:${EFXIPMGR_HOME}:${EFXIPPKG_HOME}:${PATH}"
ENV QTWEBENGINE_DISABLE_SANDBOX=1

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*