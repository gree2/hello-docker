docker run -d -p 80:80 --name website -v $PWD/website:/var/www/html/website gree2/nginx nginx