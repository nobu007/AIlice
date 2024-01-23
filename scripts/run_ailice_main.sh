#!/bin/bash

# clean cache
python3 -m site --user-site

# get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "CURRENT_DIR=$CURRENT_DIR"

cd $CURRENT_DIR/../ailice
# python3 AIliceMain.py --modelID=hf:openchat/openchat_3.5 --prompt="main" --quantization=8bit --contextWindowRatio=0.6
python3 AIliceMain.py --modelID=yka:openchat/openchat_3.5 --prompt="main" --quantization=8bit --contextWindowRatio=0.6
