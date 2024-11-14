FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY mini_server.c /
COPY build.sh /

RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    gcc mini_server.c -o webserver -l fcgi && \
    chmod +x /build.sh

ENTRYPOINT ["./build.sh"]