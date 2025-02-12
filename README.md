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

git clone https://github.com/meerkatone/Docker-Ghidra-Headless-and-Jupyter.git headless

cd headless

## Build the docker image:

docker build -t headless .

## Run the docker image:

docker run -p 8888:8888 -it -v ${PWD}:/local headless
