#!/bin/bash
### Script to setup WSL2.
### Install ROS and other packages
sudo apt update
sudo apt install -y \
ncdu \
tree \
screen
### Setup display, screen etc.
echo "export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0" >> $HOME/.bashrc
echo "export LIBGL_ALWAYS_INDIRECT=0" >> $HOME/.bashrc
mkdir -p $HOME/.screen && chmod 700 $HOME/.screen
echo "export SCREENDIR=$HOME/.screen" >> $HOME/.bashrc
