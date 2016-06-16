
# used by dockerfile
#    storm-nimbus
#        RUN /usr/bin/config-supervisord.sh nimbus 
#        RUN /usr/bin/config-supervisord.sh drpc
#    storm-supervisor
#        RUN /usr/bin/config-supervisord.sh supervisor
#        RUN /usr/bin/config-supervisord.sh logviewer
#    storm-ui
#        RUN /usr/bin/config-supervisord.sh ui
echo [program:storm-$1]    | tee -a /etc/supervisor/conf.d/storm-$1.conf
echo command=storm $1      | tee -a /etc/supervisor/conf.d/storm-$1.conf
echo directory=/home/storm | tee -a /etc/supervisor/conf.d/storm-$1.conf
echo autorestart=true      | tee -a /etc/supervisor/conf.d/storm-$1.conf
echo user=root             | tee -a /etc/supervisor/conf.d/storm-$1.conf
