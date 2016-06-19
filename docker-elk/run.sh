docker run -it --name gelasticsearch -p 9200:9200 -p 9300:9300 gree2/elasticsearch
docker run -it --link gelasticsearch --name glogstash gree2/logstash
docker run -it --link gelasticsearch --name gkibana -p 5601:5601 gree2/kibana