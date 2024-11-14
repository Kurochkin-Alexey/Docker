## Part 1. Готовый докер


##### Возьмем официальный докер-образ с **nginx** и выкатим его при помощи команды `docker pull`.
![docker_pull](images/1.1.png)

##### Проверим наличие докер-образа, запустив команды `docker images`.
![docker_images](images/1.2.png)

##### Запустим докер-образ через `docker run -d [images_id|repository]`.
![docker_run](images/1.3.png)

##### Проверим, что образ запустился через `docker ps`.
![docker_ps](images/1.4.png)

##### Посмотрим информацию о контейнере через `docker inspect [container_id|container_name]`.
![docker_ispect](images/1.5.png)
![docker_ispect_info](images/1.6.png)

##### Остановим докер образ через `docker stop [container_id|container_name]` и проверим, что образ остановился с помощью команды `docker ps`.
![docker_stop](images/1.7.png)

##### Запустим докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*.
![docker_run](images/1.8.png)

##### Проверим, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**, просто перейдя по ссылке.
![str](images/1.9.png)

##### Перезапустим докер контейнер через `docker restart [container_id|container_name]` и проверим, что запустился
![docker_restart](images/1.10.png)


## Part 2. Операции с контейнером

##### Прочитаем конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*.
![nginx.conf](images/2.1.png)

##### Создадим на локальной машине файл *nginx.conf* и настроем в нем по пути */status* отдачу страницы статуса сервера **nginx**.
![build_nginx.conf](images/2.2.png)
![nginx.conf](images/2.3.png)

##### Скопируем созданный файл *nginx.conf* внутрь докер-образа через команду `docker cp` и перезапустим.
![docker_cp](images/2.4.png)

##### Экспортируем контейнер в файл *container.tar* через команду *export* и остановим.
![docker_export](images/2.5.png)

##### Удалим образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры.
![docker_rmi](images/2.6.png)

##### Удалим остановленный контейнер.
![docker ps -a](images/2.7.png)
![docker_rm](images/2.8.png)

##### Импортируем контейнер обратно через команду *import*, запустим и проверим работу.
![docker_import](images/2.9.png)
![docker_run](images/2.10.png)
![curl](images/2.11.png)