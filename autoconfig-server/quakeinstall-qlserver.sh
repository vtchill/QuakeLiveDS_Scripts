#!/bin/bash
# quakeinstall-qlserver.sh - quake live dedicated server installation for qlserver user.
# intended to be run on a fresh VPS/Dedicated Server, this script must be run under the qlserver user.
# created by Thomas Jones on 29/09/15.
# edited by Jesse Manning on 07/11/15.

export QLDS_USER="steam"
export QLDS_CONFIG_URL="https://raw.githubusercontent.com/vtchill/QuakeLiveDS_Scripts/master"

if [ "$(whoami)" -ne "$QLDS_USER" ]
  then echo "Please run under user '$QLDS_USER'."
  exit
fi
clear
echo "Installing SteamCMD..."
mkdir ~/steamcmd
cd ~/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz
clear
echo "Installing Quake Live Dedicated Server..."
./steamcmd.sh +login anonymous +force_install_dir $HOME/steamcmd/steamapps/common/qlds/ +app_update 349090 +quit
clear
echo "Downloading qlds server scripts to $HOME"
cd ~
curl -s $QLDS_CONFIG_URL/scripts/quakeupdate.sh > quakeupdate.sh
clear
echo "Creating $HOME/.quakelive directory and copying exports"
mkdir -p $HOME/.quakelive/config/files
mkdir -p $HOME/.quakelive/log
cd ~/.quakelive
curl -s $QLDS_CONFIG_URL/scripts/quakeexports.sh > quakeexports.sh
clear
echo "Settings permissions on scripts"
chmod 744 $HOME/*.sh
clear
echo "Cronning 'QuakeUpdate.sh'..."
echo "0 8 * * * $HOME/quakeupdate.sh" > cron
crontab cron
rm cron
clear
echo "Done."
exit
