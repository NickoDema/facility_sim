FROM ubuntu:18.04
MAINTAINER Nikolay Dema <ndema2301@gmail.com>

RUN apt-get update && apt-get install -y \
    apt-utils \
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

RUN apt-get update && apt-get install -y gazebo9 \
                                         libgazebo9-dev \
                                         libignition-math4


##########################
# catkin_tools workspace #
##########################

ENV CATKIN_TWS_PATH "/root/catkin_tws"

RUN mkdir -p "$CATKIN_TWS_PATH/src"

RUN cd "$CATKIN_TWS_PATH" && catkin init

RUN cd "$CATKIN_TWS_PATH/src" && git clone -b "ariac-network-melodic" "https://github.com/osrf/ariac-gazebo_ros_pkgs.git"

ENV PATH              "$PATH:$ROS_INSTALL_PATH/bin"
ENV PYTHONPATH        "$ROS_INSTALL_PATH/lib/python2.7/dist-packages"
ENV LD_LIBRARY_PATH   "$LD_LIBRARY_PATH:$ROS_INSTALL_PATH/lib"
ENV PKG_CONFIG_PATH   "$PKG_CONFIG_PATH:$ROS_INSTALL_PATH/lib/pkgconfig"
ENV CMAKE_PREFIX_PATH "$ROS_INSTALL_PATH"

RUN apt-get install -y ros-melodic-polled-camera ros-melodic-camera-info-manager \
                       ros-melodic-control-toolbox ros-melodic-hardware-interface \
                       ros-melodic-transmission-interface \
                       ros-melodic-joint-limits-interface \
                       ros-melodic-controller-manager


RUN cd "$CATKIN_TWS_PATH" && catkin build

RUN echo "source $CATKIN_TWS_PATH/devel/setup.bash" >> "/root/.bashrc"


###################
# Installing GEAR #
###################

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable bionic main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get update && apt-get install -y ariac3


# run bash
CMD ["bash"]
