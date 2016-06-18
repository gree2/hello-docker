docker ps -a  | grep /bin/sh | awk '{print docker rm }' > a
docker images | grep none | awk '{print docker rmi }'   > b
