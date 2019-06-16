#!/bin/bash

HOST_IP_WLAN=(`ifconfig wlp1s0 | grep -Po 'inet addr:\K[\d.]+'`)  #Get wlan ip-adress

xhost +local:docker           || true

sudo docker run -ti --rm \
                --env="DISPLAY" \
                -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
                -v $PWD:/facility_sim/ \
                -v /dev:/dev \
                --net=host \
                --privileged \
                --name $1 $2
