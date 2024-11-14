#!/bin/bash

echo Wait...
docker stop nginx_serv
docker rm nginx_serv
docker rmi -f my_serv