#!/bin/bash

docker build -t my_serv .
docker run -d -p 80:81 --name nginx_serv my_serv
./presentment.sh