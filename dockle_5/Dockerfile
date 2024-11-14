FROM debian:latest

RUN useradd -d /home/nginx -m -s /bin/bash nginx

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 

RUN apt-get update && apt-get install -y nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY mini_server.c /
COPY build.sh /

RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    gcc mini_server.c -o webserver -l fcgi && \
    chmod +x /build.sh && \
    chmod -R 777 /var/lib/nginx/ && \
    chmod -R 777 /var/log/nginx/ && \
    chmod -R 777 /var/run/ && \
    chmod -R 777 /usr/sbin/unix_chkpwd && \
    chmod -R 777 /usr/bin/expiry && \
    chmod -R 777 /usr/bin/newgrp && \
    chmod -R 777 /usr/bin/mount && \
    chmod -R 777 /usr/bin/su && \
    chmod -R 777 /usr/bin/chfn && \
    chmod -R 777 /usr/bin/chage && \
    chmod -R 777 /usr/bin/umount && \
    chmod -R 777 /usr/bin/passwd && \
    chmod -R 777 /usr/bin/gpasswd && \
    chmod -R 777 /usr/bin/chsh

USER nginx

ENTRYPOINT ["./build.sh"]