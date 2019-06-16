FROM ubuntu:18.04
MAINTAINER Nikolay Dema <ndema2301@gmail.com>

RUN apt update && apt install -y \
    wget \
    unzip \
    curl \
    git \
    mc \
    vim

### Install ROS base ###
RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list



# run bash
CMD ["bash"]
