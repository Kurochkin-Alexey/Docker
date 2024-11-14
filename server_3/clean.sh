#!/bin/bash

docker stop nginx_serv
docker rm nginx_serv
docker rmi nginx -f