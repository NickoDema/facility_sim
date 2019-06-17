#!/bin/bash

HOST_IP_WLAN=(`ifconfig wlp1s0 | grep -Po 'inet addr:\K[\d.]+'`)  #Get wlan ip-adress

xhost +local:docker || true

if [ $# -eq 1 ]
  then
    TAG="facility_sim"
else
    if [ $# -ne 2 ]
      then
        CNAME="fsim"
        TAG="facility_sim"
    else
        TAG=$2
        CNAME=$1
    fi
fi

sudo docker run -ti --rm \
                --env="DISPLAY" \
                -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
                -v $PWD:/facility_sim/ \
                -v /dev:/dev \
                --net=host \
                --privileged \
                --name $CNAME $TAG
