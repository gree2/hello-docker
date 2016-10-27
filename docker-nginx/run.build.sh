docker stop website
docker rm website
docker rmi gree2/nginx
docker build -t gree2/nginx .