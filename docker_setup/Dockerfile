FROM ubuntu:18.04
MAINTAINER Nikolay Dema <ndema2301@gmail.com>

RUN apt-get update && apt-get install -y \
    gnupg2 \
    net-tools \
    wget \
    unzip \
    curl \
    git \
    mc \
    vim


##########################
# Timezone Configuration #
##########################

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


#######################
# Install ROS desktop #
#######################

ENV ROS_DISTRO melodic
ENV ROS_INSTALL_PATH "/opt/ros/$ROS_DISTRO/"

RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && apt-get install -y ros-melodic-desktop

RUN rosdep init
RUN rosdep update

WORKDIR "/"
RUN echo "source $ROS_INSTALL_PATH/setup.bash" >> "/root/.bashrc"


########################
# Install catkin tools #
########################

RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -

RUN apt-get update && apt-get install -y python-catkin-tools


####################
# Install Gazebo 9 #
####################

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable bionic main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get update && apt-get install -y gazebo9 libgazebo9-dev

# run bash
CMD ["bash"]
