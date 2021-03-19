#!/usr/bin/env bash
set -euo pipefail
export LD_LIBRARY_PATH=./linux64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export SteamAppId=892970
export PATH="/run/current-system/sw/bin:$PATH" # need to find steamcmd/steam=run

echo "Updating server..."
steamcmd +login anonymous +force_install_dir $PWD +app_update 896660 validate +exit
echo "Update complete!"
echo "Starting server"
valheim_password=$(cat $1) # credential is passed via ExecStart = start_valheim.sh ${CREDENTIALS_DIRECTORY}/VALHEIM_PASSWORD
steam-run "$PWD/valheim_server.x86_64" -nographics -batchmode -name "SausageFingers Server" -port 2456 -world "SausageFingers" -password "$valheim_password" -public 1

