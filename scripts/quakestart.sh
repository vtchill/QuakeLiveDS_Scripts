#!/bin/bash
# quakestart.sh - quake live multiple server spawning script.
# created by Thomas Jones on 09/09/15.
# purger@tomtecsolutions.com

# source the exports file
# cannot use $HOME here because this is invoked by upstart
# and the $HOME env is not set correctly at that time
. "/home/steam/.quakelive/quakeexports.sh"

gameport=`expr $1 + 27960`
rconport=`expr $1 + 28960`
servernum=`expr $1 + 1`

# Starts servers with different settings, based off the process number parsed
# as argument 1 by supervisord.

echo "========== QuakeStart.sh has started. =========="
echo "========= $(date) ========="
#echo "arg1 is equal to $1"
cd $QLDS_DIR/baseq3

# starting vql duel 1...
echo "Starting VQL duel servers..."
exec $QLDS_X86 \
  +set net_strict 1 \
  +set net_port $gameport \
  +set sv_hostname "EPOCH VQL Duel #$servernum" \
  +set fs_homepath "$QLDS_CONFIG_DIR" \
  +set sv_tags "$QLDS_TAGS" \
  +set sv_mappoolFile "mappool_vqlduel.txt" \
  +set bot_enable 1 \
  +set bot_nochat 1 \
  +set g_voteFlags "13320" \
  +set g_allowSpecVote 0 \
  +set g_allowVoteMidGame 0 \
  +set g_damage_lg 6 \
  +set g_accessFile "access.txt" \
  +set zmq_rcon_enable 1 \
  +set zmq_rcon_password "$QLDS_RCON_PW" \
  +set zmq_rcon_port $rconport \
  +set zmq_stats_enable 1 \
  +set zmq_stats_password "" \
  +set zmq_stats_port $gameport
