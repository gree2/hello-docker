docker ps -a  | grep /bin/sh | awk '{print $1}' | xargs docker rm
docker images | grep none | awk '{print $3}'    | xargs docker rmi
docker rm gelk
docker rmi gree2/elk
docker ps -a
docker images
