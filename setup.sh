#!/bin/bash

# set container env variables
export EFINITY_HOME=/efinity/2023.2
export EFXPT_HOME=${EFINITY_HOME}/pt
export EFXPGM_HOME=${EFINITY_HOME}/pgm
export EFXDBG_HOME=${EFINITY_HOME}/debugger
export EFXIPM_HOME=${EFINITY_HOME}/ipm
export EFXIPMGR_HOME=${EFINITY_HOME}/ipm/bin/ip_manager
export EFXIPPKG_HOME=${EFINITY_HOME}/ipm/bin/ip_packager
export EFXSVF_HOME=${EFINITY_HOME}/debugger/svf_player
export QT_LOGGING_CONF=${EFINITY_HOME}/bin/lc.ini
export QT_PLUGIN_PATH=${EFINITY_HOME}/lib/plugins
export PATH=${EFINITY_HOME}/bin:${EFINITY_HOME}/scripts:${EFXPGM_HOME}/bin:${EFXDBG_HOME}/bin:${EFXSVF_HOME}/bin:${EFXIPM_HOME}/bin:${EFXIPMGR_HOME}:${EFXIPPKG_HOME}:${PATH}
export QTWEBENGINE_DISABLE_SANDBOX=1