# Docker-Ghidra-Headless-and-Jupyter

Youtube video:
https://youtu.be/Jvq-22jsxco

## Install Docker Desktop on your host machine:

https://www.docker.com/products/docker-desktop/

## Running docker without sudo under Linux - from your terminal run the following:

sudo groupadd docker

sudo gpasswd -a $USER docker

sudo usermod -aG docker $USER

## Clone the repo:

git clone https://github.com/meerkatone/docker_ghidra_headless_and_jupyter.git headless

cd headless

## Build the docker image:

docker build -t headless .


## Build the docker image for Apple Silicon:

Disable ```Use containerd for pulling and storing images``` under Docker Desktop, "Settings" > "General"

docker build -t headless . --platform=linux/amd64 --no-cache

## Run the docker image:

docker run -p 8888:8888 -it -v ${PWD}:/local headless
