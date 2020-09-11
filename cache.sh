### Start cache server
docker run -d -p 3142:3142 -v apt-cache:/var/cache/apt-cacher-ng --name apt-cacher-ng --restart=unless-stopped konstruktoid/apt-cacher-ng
# docker run -d -p 3142:3142 -v apt-cache:/var/cache/apt-cacher-ng --name apt-cacher-ng --restart=unless-stopped sameersbn/apt-cacher-ng:latest

### Setup WSL to use HTTP Proxy http://host.docker.internal:3142
# sudo -c `echo 'Acquire::http { Proxy "http://host.docker.internal:3142"; };' >> /etc/apt/apt.conf.d/30proxy`
sudo cp files/30proxy /etc/apt/apt.conf.d/

### Cache some initial ROS data
docker run --rm -it -v $pwd/files:/files ros:indigo-ros-core bash /files/setup_cache.sh
docker run --rm -it -v $pwd/files:/files ros:kinetic-ros-core bash /files/setup_cache.sh
docker run --rm -it -v $pwd/files:/files ros:melodic-ros-core bash /files/setup_cache.sh
docker run --rm -it -v $pwd/files:/files ros:noetic-ros-core bash /files/setup_cache.sh