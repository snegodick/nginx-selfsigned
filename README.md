
# Nginx reverse proxy with selfsigned certificate
### Features

 - Websockets proxy enabled

### Easy start

      docker run -it -d \
      --name app_reverse \
      -p 18443:443 \
      -e NGX_FORWARD_TO=https://dnbproducer.ru \
      snegowiki/nginx-selfsigned

### Docker build
      docker build -t snegowiki/nginx-selfsigned .
      docker run -it -d --name app_revers -p 18443:443 -e NGX_FORWARD_TO=https://dnbproducer.ru snegowiki/nginx-selfsigned

## Links
 - [Docker hub](https://hub.docker.com/r/snegowiki/nginx-selfsigned) 
 - [Github](https://github.com/snegodick/nginx-selfsigned)
