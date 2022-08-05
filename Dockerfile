FROM debian:bullseye
RUN apt update
RUN apt install -y nginx-full openssl && apt clean && rm -rf /var/lib/apt/lists/*
#apt install procps
RUN openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/nginx/server.key -out /etc/nginx/server.crt -subj "/C=US/ST=New Sweden/L=Stockholm /O= /OU= /CN= /emailAddress= " 
RUN update-rc.d nginx remove
COPY default /etc/nginx/sites-enabled/
COPY entry.sh /opt/
WORKDIR /opt
EXPOSE 443
ARG NGX_FORWARD_TO=https://ya.ru
ENV NGX_FORWARD_TO="${NGX_FORWARD_TO}"
ENTRYPOINT bash /opt/entry.sh

#docker build -t snegowiki/nginx-selfsigned .
#docker login
#docker push snegowiki/nginx-selfsigned
#docker run -it -d --name app_revers -p 18443:443 -e NGX_FORWARD_TO=https://rbc.ru snegowiki/nginx-selfsigned