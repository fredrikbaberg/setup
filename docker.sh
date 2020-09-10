### Different Docker containers
docker run -d -p 3142:3142 -v apt-cacher-ng_data:/var/cache/apt-cacher-ng --name apt-cacher-ng --restart=unless-stopped sameersbn/apt-cacher-ng:latest
sudo cp 30proxy /etc/apt/apt.conf.d/
# Set HTTP Proxy to http://host.docker.internal:3142