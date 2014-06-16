### Dockermized SOAPDenovo2.04
## use the dockerfile/ubuntu base image provided by https://index.docker.io/u/dockerfile/ubuntu/
# The environment is ubuntu-14.04
FROM dockerfile/python

MAINTAINER David Weng weng@email.arizona.edu
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

## Step 1: Install the basic tools to set up the environment.
# Install the wget, gcc, make tools, handling the lib dependency problem.
RUN apt-get install -y wget

# Make sure the working directory is Vagrant.
WORKDIR /home/vagrant

## Step 2: Download the binary file.
RUN wget --trust-server-name http://sourceforge.net/projects/soapdenovo2/files/SOAPdenovo2/bin/r240/SOAPdenovo2-bin-LINUX-generic-r240.tgz/download
RUN tar xvfz SOAPdenovo2-bin-LINUX-generic-r240.tgz

## Step 3: Add the executables directory to the Path.
ENV PATH /home/vagrant/SOAPdenovo2-bin-LINUX-generic-r240:$PATH
