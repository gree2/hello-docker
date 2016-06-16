FROM gree2/base
MAINTAINER gree2 

# download apache-storm and extract to /opt
RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/apache-storm-0.9.4
# 1. add group storm
# 2. add user  storm with home dir
# 3. chown storm's ~
# 4. mkdir log dir and chown
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

# link /usr/bin/storm to storm
RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

# append 2 line
# 1. section [supervisord]
# 2. nodaemon=true
RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
