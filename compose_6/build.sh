docker stop $(docker ps -a -q)
docker compose build
docker compose up
docker compose down
docker rmi -f compose_6-service 