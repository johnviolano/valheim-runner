#!/usr/bin/env bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# need to find steamcmd/steam=run
export PATH=/run/current-system/sw/bin:$PATH

echo "Updating server..."
steamcmd +login anonymous +force_install_dir $PWD +app_update 896660 validate +exit
echo "Update complete!"


echo "Starting server PRESS CTRL-C to exit"
valheim_password=$VALHEIM_PASSWORD
echo "Read password as [ $valheim_password ]"
steam-run $PWD/valheim_server.x86_64 -nographics -batchmode -name "SausageFingers Server" -port 2456 -world "SausageFingers" -password "$valheim_password" -public 1

export LD_LIBRARY_PATH=$templdpath
