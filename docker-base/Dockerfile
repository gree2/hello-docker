FROM ubuntu:trusty
MAINTAINER gree2

RUN apt-get update          \
    && apt-get install -y   \
        apt-transport-https \
        curl           \
        docker.io      \
        openjdk-7-jre-headless \
        openssh-server \
        supervisor     \
        unzip          \
        wget

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
RUN echo 'root:node' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
