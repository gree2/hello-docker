FROM gree2/base
MAINTAINER gree2

# 0. download
# 1. unzip
# 2. rm tmp file
RUN wget -q https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz \
         -O /tmp/elasticsearch-2.3.3.tar.gz && \
tar zxf /tmp/elasticsearch-2.3.3.tar.gz -C /opt && \
rm /tmp/elasticsearch-2.3.3.tar.gz

# setup env
ENV ELASTICSEARCH_HOME /opt/elasticsearch-2.3.3
RUN ln -s $ELASTICSEARCH_HOME/bin/elasticsearch /usr/bin/elasticsearch

# add group/user 
RUN groupadd elasticsearch; \
useradd --gid elasticsearch --home-dir /home/elasticsearch --create-home --shell /bin/bash elasticsearch; \
chown -R elasticsearch:elasticsearch $ELASTICSEARCH_HOME; \
chown -R elasticsearch:elasticsearch /usr/bin/elasticsearch

EXPOSE 9200
EXPOSE 9300

# change user to
# http://stackoverflow.com/questions/24549746/switching-users-inside-docker-image-to-a-non-root-user
USER elasticsearch
CMD elasticsearch
# CMD elasticsearch --cluster.name elasticsearch_cluster_g --node.name node_g
