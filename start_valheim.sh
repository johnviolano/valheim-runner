#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
export PATH=/run/current-system/sw/bin:$PATH

mkdir -p /home/steam/valheim
echo "Changing to /home/steam/valheim"
cd /home/steam/valheim

echo "Updating server..."
steamcmd +login anonymous +force_install_dir /home/steam/valheim +app_update 896660 validate +exit
echo "Update complete!"


echo "Starting server PRESS CTRL-C to exit"
steam-run /home/steam/valheim/valheim_server.x86_64 -nographics -batchmode -name "SausageFingers Server" -port 2456 -world "SausageFingers" -password "TEMP_REPLACE_ME" -public 1 &

export LD_LIBRARY_PATH=$templdpath
