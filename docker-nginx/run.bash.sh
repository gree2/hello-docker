docker run -d -p 80:80 --name website gree2/nginx nginx
# docker run -it -p 80 --name website -v $PWD/website:/var/www/html/website gree2/nginx nginx
# docker run -it -p 80:80 --name website -v $PWD/website:/var/www/html/website gree2/nginx /bin/bash