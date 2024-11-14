#!/bin/bash

until curl -s http://localhost:80/ > /dev/null; do
  echo "Waiting for the server to be up..."
  sleep 1
done
echo http://localhost:80:
curl http://localhost:80/
printf "\nhttp://localhost:80/status:\n"
curl http://localhost:80/status
echo "Press Enter to clean"
read symbol
./clean.sh