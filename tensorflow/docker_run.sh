#!/bin/bash

container_name=gpu-py3-jupyter

docker container stop $container_name

docker run --runtime=nvidia \
           --gpus all \
           --name $container_name \
           --rm \
           -d \
             -v $(realpath ${location}):/tf/notebooks \
           -p 8888:8888 \
	   -p 6006:6006 \
           springloops/tensorflow:1.14.0-gpu-py3


#TOKEN=$(docker exec gpu-py3-jupyter jupyter notebook list --json | jq -r .token)

#echo 'go to jupyter'
#echo "http://ground:8888/?token=$TOKEN"
