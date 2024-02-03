#!/bin/bash

# get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "CURRENT_DIR=$CURRENT_DIR"
HOME_DIR=$(echo ~)

# clean cache
python3 -m site --user-site

# docker
# docker run --gpus all --rm -p 127.0.0.1:59000-59200:59000-59200 -p 127.0.0.1:7860:7860 --env-file .env --name scripter env4scripter
docker run --gpus all --rm -p 127.0.0.1:59000-59200:59000-59200 -p 127.0.0.1:7860:7860 --env-file .env --mount type=bind,source=${HOME_DIR}/.cache/huggingface/hub,target=/root/.cache/huggingface/hub --name scripter env4scripter
