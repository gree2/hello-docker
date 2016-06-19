FROM gree2/base
MAINTAINER gree2

ENV ES_VERSION 2.3.3
ENV LOGSTASH_VERSION 1:2.3.3-1
ENV KIBANA_VERSION 4.5.1

RUN sed -i "s/archive.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get install apt-transport-https
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list \
    && echo "deb https://packages.elastic.co/logstash/2.3/debian stable main"         | tee -a /etc/apt/sources.list       \
    && echo "deb http://packages.elastic.co/kibana/4.5/debian stable main"            | tee -a /etc/apt/sources.list       \
    && wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
    && apt-get update && apt-get install elasticsearch=${ES_VERSION} logstash=${LOGSTASH_VERSION} kibana=${KIBANA_VERSION} \
    && apt-get clean

ENV ES_HOME /usr/share/elasticsearch
RUN ln -s ${ES_HOME}/bin/elasticsearch /usr/bin/elasticsearch

ENV LOGSTASH_HOME /opt/logstash
RUN ln -s ${LOGSTASH_HOME}/bin/logstash /usr/bin/logstash

ENV KIBANA_HOME /opt/kibana
RUN ln -s ${KIBANA_HOME}/bin/kibana /usr/bin/kibana

# change ownership
RUN chown -R elasticsearch:elasticsearch ${ES_HOME}; \
    chown -R elasticsearch:elasticsearch ${LOGSTASH_HOME}; \
    chown -R elasticsearch:elasticsearch ${KIBANA_HOME}; \
    chown -R elasticsearch:elasticsearch /usr/bin/elasticsearch; \
    chown -R elasticsearch:elasticsearch /usr/bin/logstash; \
    chown -R elasticsearch:elasticsearch /usr/bin/kibana

# ADD config.supervisord.sh /usr/bin/config.supervisord.sh

# ENV LOGSTASH_CMD "logstash -e 'input { stdin { } } output{ elasticsearch { } }'"
# # config.supervisord.sh            program_name    program_bin       program_home     run_as
# RUN /usr/bin/config.supervisord.sh "elasticsearch" "elasticsearch"   "${ES_HOME}"       "elasticsearch"
# RUN /usr/bin/config.supervisord.sh "logstash"      "${LOGSTASH_CMD}" "${LOGSTASH_HOME}" "elasticsearch"
# RUN /usr/bin/config.supervisord.sh "kibana"        "kibana"          "${KIBANA_HOME}"   "elasticsearch"

# EXPOSE 5601 9200 9300 5000 5044

# RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf; \
#     echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf

# CMD /usr/sbin/sshd && supervisord

RUN update-rc.d elasticsearch defaults 95 10 \
    && update-rc.d kibana     defaults 95 10 \
    && /etc/init.d/elasticsearch start       \
    && /etc/init.d/elasticsearch kibana

EXPOSE 5601 9200 9300 5000 5044

# ENTRYPOINT logstash -e 'input { stdin { } } output{ elasticsearch { } }'
