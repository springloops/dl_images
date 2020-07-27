#!/bin/bash

docker run -itd --name pytorch \
-e NEW_USER=$(whoami) \
-v /home/springloops/data/play/pytorch:/workspace \
-p 8888:8888 \
--gpus all \
--restart=always \
springloops/pytorch 
