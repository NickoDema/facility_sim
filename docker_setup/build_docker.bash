#!/bin/bash

if [ $# -eq 1 ]
  then
    sudo docker build -t $1 .
else
    sudo docker build -t "facility_sim" .
fi
