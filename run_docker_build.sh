#!/bin/bash

# get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "CURRENT_DIR=$CURRENT_DIR"

# copy .env and yka_langchain.py to docker build context
cp -p "${CURRENT_DIR}/../.env" "${CURRENT_DIR}/.env"
cp -p "${CURRENT_DIR}/../../common/yka_langchain.py" "${CURRENT_DIR}/ailice/"
# cp -p "${CURRENT_DIR}/../../common/yka_langchain.py" "${CURRENT_DIR}/ailice/core/llm/"

docker build --progress plain -t env4scripter --build-arg YKA_COMMON_DIR="${CURRENT_DIR}/../../common" .
