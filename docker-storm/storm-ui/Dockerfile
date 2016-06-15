FROM gree2/storm:0.9.4
MAINTAINER gree2

RUN /usr/bin/config-supervisord.sh ui

EXPOSE 8080
CMD /usr/bin/start-supervisor.sh
