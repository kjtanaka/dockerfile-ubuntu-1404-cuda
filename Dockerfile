#
# Ubuntu 14.04 Cuda Dockerfile
#
#
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Koji Tanaka <kj.tanaka@gmail.com>

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget && \
  wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_6.5-14_amd64.deb && \
  dpkg -i cuda-repo-ubuntu1404_6.5-14_amd64.deb && \
  rm -f cuda-repo-ubuntu1404_6.5-14_amd64.deb && \
  apt-get update && \
  apt-get -y install cuda && \
  rm -rf /var/lib/apt/lists/*

RUN \
  echo "export CUDA_HOME=/usr/local/cuda-6.5" >> /root/.bashrc && \
  echo "export LD_LIBRARY_PATH=\${CUDA_HOME}/lib64" >> /root/.bashrc && \
  echo "export PATH=\${CUDA_HOME}/bin:\${PATH}" >> /root/.bashrc

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
