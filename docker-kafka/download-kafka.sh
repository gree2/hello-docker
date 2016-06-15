#!/bin/sh

# curl output
# {
#    "backup": [ "http://www-eu.apache.org/dist/", "http://www-us.apache.org/dist/" ],
#      "cca2": "cn",
#      "http": [ "http://apache.fayea.com/", "http://mirror.bit.edu.cn/apache/", "http://mirrors.cnnic.cn/apache/", "http://mirrors.hust.edu.cn/apache/", "http://mirrors.noc.im/apache/", "http://mirrors.tuna.tsinghua.edu.cn/apache/" ],
# "path_info": "",
# "preferred": "http://apache.fayea.com/"
# }

# jq output
# http://apache.fayea.com/

mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
# http://apache.fayea.com/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz
url="${mirror}kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

wget -q "${url}" -O "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
