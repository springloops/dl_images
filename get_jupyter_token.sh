#!/bin/bash

container_name=$1
CONTAINER_ID=$(docker ps -aqf "name=${container_name}")

JS=$(docker exec -t ${CONTAINER_ID} jupyter notebook list --json)
TOKEN=$(echo $JS | jq -r .token)
 
echo "Jupyter Token $TOKEN"

