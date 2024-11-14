#!/bin/bash

docker pull nginx
docker run -d -p 81:81 --name nginx_serv nginx
docker cp ./mini_server.c nginx_serv:etc/nginx
docker cp ./nginx.conf nginx_serv:etc/nginx/nginx.conf
docker exec nginx_serv apt-get update
docker exec nginx_serv apt-get install -y gcc spawn-fcgi libfcgi-dev
docker exec nginx_serv gcc /etc/nginx/mini_server.c -o /etc/nginx/webserver -lfcgi -lpthread
docker exec nginx_serv spawn-fcgi -p 8080 /etc/nginx/webserver
docker exec nginx_serv nginx -s reload
curl localhost:81
printf "\n\nPress Enter to clean:\n"
read symbol
./clean.sh