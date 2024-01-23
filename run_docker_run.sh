#!/bin/bash

# clean cache
python3 -m site --user-site

# docker
docker run --gpus all -d -p 127.0.0.1:59000-59200:59000-59200 -p 127.0.0.1:7860:7860 --name scripter env4scripter
