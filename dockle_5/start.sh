# export DOCKER_CONTENT_TRUST=1
docker build . -t my_serv:1.0
printf "\nWait for dockle...\n"
dockle --ignore CIS-DI-0005 my_serv:1.0 # флаг --ignore CIS-DI-0005 связан с выводом о том, что контейнер не из репозитория
docker run -d -p 80:81 --name serv my_serv:1.0
printf "\nWait...\n"
echo "Press Enter to clean"
read symbol
echo Wait...
# export DOCKER_CONTENT_TRUST=0
docker stop serv
docker rm serv
docker rmi -f my_serv:1.0