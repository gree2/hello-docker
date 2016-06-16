# hello-docker

## docker-base

- ```docker build -t gree2/base .```

## docker-kafka

1. use `anapsix/alpine-java`

1. update and install
	
	1. unzip

	1. wget

	1. curl

	1. docker

	1. jq

	1. coreutils

1. setup env `KAFKA_VERSION` and `SCALA_VERSION`

	1. kafka 0.10.0.0

	1. scala 2.11

1. add `download-kafka.sh` to `/tmp/`

1. download and extract to /opt/

1. mount `/kafka` volume

1. set env `KAFKA_HOME`

1. add shell scripts

	1. start-kafka.sh

	1. broker-list.sh

	1. create-topics.sh

1. start kafka use shell script

## docker-storm

- ```rebuild.sh```

## docker-zookeeper

- ```docker build -t gree2/zookeeper .```
