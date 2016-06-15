#!/bin/bash

# get `CONTAINER ID` from `docker ps` command
# you might get `3ed41330b857`
CONTAINERS=$(docker ps | grep 9092 | awk '{print $1}')

# docker port 3ed41330b857 9092
# 0.0.0.0:9092

# docker port 3ed41330b857
# 9092/tcp -> 0.0.0.0:9092

# $HOST_IP => 192.168.99.100
# sed -e "s/0.0.0.0:/$HOST_IP:/g"
# 0.0.0.0:9092 => 192.168.99.100:9092
BROKERS=$(for CONTAINER in $CONTAINERS; do docker port $CONTAINER 9092 | sed -e "s/0.0.0.0:/$HOST_IP:/g"; done)

# replace
echo $BROKERS | sed -e 's/ /,/g'
