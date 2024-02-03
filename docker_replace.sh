#!/bin/bash

# get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "CURRENT_DIR=$CURRENT_DIR"

# rm ~/.config/ailice/config.json
cd $CURRENT_DIR
# copy all files to docker
docker cp .env scripter:/scripter/.env
docker cp ailice/. scripter:/scripter/ailice
docker cp scripts/. scripter:/scripter/scripts

# restart docker
echo "Restarting docker..."
# docker restart scripter
echo "Restarting docker...done"