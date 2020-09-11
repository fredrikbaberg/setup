export DEBIAN_FRONTEND=noninteractive
cp /files/30proxy /etc/apt/apt.conf.d/30proxy
apt update -q
apt install -yq python3-pip
pip3 install apt-select
apt-select --country SE
cp sources.list /etc/apt/sources.list
apt update -q
apt install -yq --download-only ros-$ROS_DISTRO-desktop-full