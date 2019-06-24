#!/bin/bash

if [ $# -eq 0 ]
  then
    CNAME="fsim"
else
    CNAME=$1
fi

sudo docker exec -ti $CNAME bash
