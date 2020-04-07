#!/bin/bash

container_name=gpu-py3-jupyter
CONTAINER_ID=$(docker ps -aqf "name=${container_name}")

JS=$(docker exec -t ${CONTAINER_ID} jupyter notebook list --json)
TOKEN=$(echo $JS | jq -r .token)

JT_URL="http://HOST:8888/?token=$TOKEN" 

echo 'go to jupyter'
echo $JT_URL

