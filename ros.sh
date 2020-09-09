#!/bin/bash
### Setup ROS sources
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
### Setup Gazebo sources
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
### Install using APT
sudo apt update
sudo apt install -y \
build-essential \
python-rosdep \
python-catkin-tools \
python-rosinstall \
python-rosinstall-generator \
python-wstool \
ros-*-desktop-full \
ros-*-rosbridge-server
### Configure ROS
source /opt/ros/*/setup.bash
sudo rosdep init
rosdep update
### Setup workspace
mkdir -p $HOME/catkin_ws/src
git clone https://github.com/siemens/ros-sharp.git --single-branch --branch master /tmp/ros-sharp && cp -R /tmp/ros-sharp/ROS/ $HOME/catkin_ws/src/ros-sharp && rm -rf /tmp/ros-sharp
mkdir -p ~/.gazebo && git clone https://github.com/osrf/gazebo_models --single-branch --branch master $HOME/.gazebo/models && rm -rf ~/.gazebo/models/.git
### Add line for sourcing ROS to .bashrc
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> $HOME/.bashrc
