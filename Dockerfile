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
    libdbus-1-3

# Copy the efinity directory to the image
COPY ./efinity /efinity


# set env variables in the image
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
ENV PYTHONPATH="${EFINITY_HOME}/lib:${PYTHONPATH}"
ENV PYTHONHOME="${EFINITY_HOME}"
ENV QTWEBENGINE_DISABLE_SANDBOX=1

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
