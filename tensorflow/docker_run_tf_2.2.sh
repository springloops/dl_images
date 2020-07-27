#!/bin/bash

container_name=tf-2.2-gpu-py3-jupyter

docker container stop $container_name

docker run --runtime=nvidia \
           --gpus all \
           --name $container_name \
           --rm \
           -d \
             -v $(realpath $1):/tf/notebooks \
           -p 8888:8888 \
	   -p 6006:6006 \
           tensorflow/tensorflow:2.2.0-gpu-jupyter


#TOKEN=$(docker exec gpu-py3-jupyter jupyter notebook list --json | jq -r .token)

#echo 'go to jupyter'
#echo "http://ground:8888/?token=$TOKEN"
