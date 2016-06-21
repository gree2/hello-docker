FROM gree2/base
MAINTAINER gree2

# 0. use mirror
# 1. update install
# 2. import pgp key
# 3. save repo definition
# 4. update install logstash
RUN sudo sed -i "s/archive.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list && \
sudo apt-get update && apt-get install apt-transport-https && \
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - && \
echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list && \
sudo apt-get update && sudo apt-get install logstash

ENV LOGSTASH_HOME /opt/logstash
RUN ln -s $LOGSTASH_HOME/bin/logstash /usr/bin/logstash
ADD goog.conf $LOGSTASH_HOME/demo/goog.conf
ADD goog.csv  $LOGSTASH_HOME/demo/goog.csv

CMD logstash -e 'input { stdin { } } output{ stdout{ } }'
