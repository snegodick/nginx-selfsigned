#!/bin/bash
CERT_KEY="/etc/nginx/server.key"
CERT_CRT="/etc/nginx/server.crt"

# Генерация сертификата, если он не существует
if [ ! -f "$CERT_KEY" ] || [ ! -f "$CERT_CRT" ]; then
    echo "Generating self-signed certificate..."
    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
    -keyout "$CERT_KEY" -out "$CERT_CRT" \
    -subj "/C=US/ST=New Sweden/L=Stockholm /O= /OU= /CN= /emailAddress= "
else
    echo "Using existing certificates."
fi

echo "Remote URL: $NGX_FORWARD_TO"
sed -i -e "s|NGX_FORWARD_TO|$NGX_FORWARD_TO|g" /etc/nginx/sites-enabled/default
exec nginx -g "daemon off;"
#nginx -g 'daemon off;'
