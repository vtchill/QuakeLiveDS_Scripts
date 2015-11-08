#!/bin/bash

# variables used through the install and configuration scripts
export QLDS_USER_HOME='/home/steam'
export QLDS_DIR="$QLDS_USER_HOME/steamcmd/steamapps/common/qlds"
export QLDS_WORKSHOP_DIR="$QLDS_DIR/steamapps/workshop"
export QLDS_X86="$QLDS_DIR/run_server_x86.sh"
export QLDS_X64="$QLDS_DIR/run_server_x64.sh"
export QLDS_CONFIG_URL="https://raw.githubusercontent.com/vtchill/QuakeLiveDS_Scripts/master"
export QLDS_CONFIG_DIR="$QLDS_USER_HOME/.quakelive/config/baseq3"
export QLDS_TAGS="US,CO,epoch"

# private
# export QLDS_RCON_PW=XXXX
