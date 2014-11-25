#
# Ubuntu 14.04 Cuda 6.5 Dockerfile
#
# https://registry.hub.docker.com/u/kjtanaka/dockerfile-ubuntu-1404-cuda/
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Koji Tanaka <kj.tanaka@gmail.com>

# Install.
RUN  apt-get update
RUN  apt-get -y dist-upgrade
RUN  apt-get install -y wget
RUN  wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_6.5-14_amd64.deb
RUN  dpkg -i cuda-repo-ubuntu1404_6.5-14_amd64.deb
RUN  rm -f cuda-repo-ubuntu1404_6.5-14_amd64.deb
RUN  apt-get update
RUN  apt-get -y install cuda || echo ignore error
RUN  rm -rf /var/lib/apt/lists/*

RUN  echo "export CUDA_HOME=/usr/local/cuda-6.5" >> /root/.bashrc
RUN  echo "export LD_LIBRARY_PATH=\${CUDA_HOME}/lib64" >> /root/.bashrc
RUN  echo "export PATH=\${CUDA_HOME}/bin:\${PATH}" >> /root/.bashrc

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
