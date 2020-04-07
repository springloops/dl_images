#!/bin/bash

container_name=mxnet-gpu-py3-jupyter

docker container stop $container_name

docker run --runtime=nvidia \
           --gpus all \
           --name $container_name \
           --rm \
           -d \
             -v $(realpath ${location}):/mxnet \
           -p 8888:8888 \
           springloops/mxnet:nightly_gpu_cu101_mkl_py3


#TOKEN=$(docker exec gpu-py3-jupyter jupyter notebook list --json | jq -r .token)

#echo 'go to jupyter'
#echo "http://ground:8888/?token=$TOKEN"
