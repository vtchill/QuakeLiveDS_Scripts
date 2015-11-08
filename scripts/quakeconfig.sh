#!/bin/bash
# quakeconfig.txt - quake live server file sync.
# created by Thomas Jones on 09/10/15.
# purger@tomtecsolutions.com

# source the exports file
. "$HOME/.quakelive/quakeexports.sh"

echo "========== QuakeConfig.sh has started. =========="
echo "========= $(date) ========="

cd ~

# Downloading a new copy of some files.
echo "Downloading and replacing quakestart.sh..."
rm quakestart.sh
curl -s $QLDS_CONFIG_URL/scripts/quakestart.sh > quakestart.sh
dos2unix --quiet quakestart.sh
chmod +x quakestart.sh
echo "Downloading and replacing quakeupdate.sh..."
rm quakeupdate.sh
curl -s $QLDS_CONFIG_URL/scripts/quakeupdate.sh > quakeupdate.sh
dos2unix --quiet quakeupdate.sh
chmod +x quakeupdate.sh
echo "Downloading and replacing autodownload.sh..."
rm autodownload.sh
curl -s $QLDS_CONFIG_URL/scripts/autodownload.sh > autodownload.sh
dos2unix --quiet autodownload.sh
chmod +x autodownload.sh
echo "Stopping, downloading and replacing quakemotd.sh..."
killall quakemotd.sh
rm quakemotd.sh
curl -s $QLDS_CONFIG_URL/scripts/quakemotd.sh > quakemotd.sh
dos2unix --quiet quakemotd.sh
chmod +x quakemotd.sh

cd $QLDS_CONFIG_DIR/files
echo "Downloading and replacing server.cfg..."
rm server.cfg
curl -s $QLDS_CONFIG_URL/config-files/server.txt > server.cfg
dos2unix --quiet server.cfg
echo "Downloading and replacing access.txt..."
rm access.txt
curl -s $QLDS_CONFIG_URL/config-files/access.txt > access.txt
dos2unix --quiet access.txt
echo "Downloading and replacing workshop.txt..."
rm workshop.txt
curl -s $QLDS_CONFIG_URL/config-files/workshop.txt > workshop.txt
dos2unix --quiet workshop.txt
# echo "Downloading and updating all access files..."
# rm -f access*
# curl -s $QLDS_CONFIG_URL/accesses/accesses.zip > accesses.zip
# unzip -o accesses.zip; rm accesses.zip
# rm -rf __MACOSX
# dos2unix --quiet access*
echo "Downloading and updating all map-pool files..."
rm -f mappool_*
curl -s $QLDS_CONFIG_URL/mappools/mappools.zip > mappools.zip
unzip -o mappools.zip; rm mappools.zip
rm -rf __MACOSX
dos2unix --quiet mappool_*
echo "Downloading and updating all factories..."
rm -rf scripts/
curl -s $QLDS_CONFIG_URL/factories/factories.zip > factories.zip
unzip -o factories.zip
rm factories.zip
rm -rf __MACOSX; mkdir scripts
mv *.factories scripts/
dos2unix --quiet scripts/*
echo "Downloading and replacing all entities..."
rm -rf entities/
curl -s $QLDS_CONFIG_URL/entities/entities.zip > entities.zip
unzip -o entities.zip
rm entities.zip
rm -rf __MACOSX
mkdir entities
mv *.ent entities/
dos2unix --quiet entities/*
echo "Downloading and replacing '/etc/supervisord.conf'..."
sudo rm /etc/supervisord.conf
curl -s $QLDS_CONFIG_URL/config-files/supervisord.txt > supervisord.conf
sudo mv supervisord.conf /etc/supervisord.conf
sudo dos2unix --quiet /etc/supervisord.conf
sudo chmod 755 /etc/supervisord.conf
echo "Downloading and replacing /etc/init/supervisor.conf' ..."
sudo rm /etc/init/supervisord.conf
curl -s $QLDS_CONFIG_URL/config-files/supervisor-upstart.conf > supervisor-upstart.conf
sudo mv supervisor-upstart.conf /etc/init/supervisord.conf
sudo dos2unix --quiet /etc/init/supervisord.conf
echo "Done."
exit 0
