FROM gree2/base
MAINTAINER gree2

ENV ES_VERSION 2.3.3

RUN sed -i "s/archive.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get install apt-transport-https
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list \
    && wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
    && apt-get update && apt-get install elasticsearch=${ES_VERSION} \
    && apt-get clean

# setup env
ENV ES_HOME /usr/share/elasticsearch
RUN ln -s ${ES_HOME}/bin/elasticsearch /usr/bin/elasticsearch

# add group/user
RUN chown -R elasticsearch:elasticsearch $ELASTICSEARCH_HOME; \
    chown -R elasticsearch:elasticsearch /usr/bin/elasticsearch

EXPOSE 9200
EXPOSE 9300

RUN update-rc.d elasticsearch defaults 95 10 \
    && /etc/init.d/elasticsearch start       \
