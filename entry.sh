#!/bin/bash
echo "Remote URL: $NGX_FORWARD_TO"
sed -i -e "s|NGX_FORWARD_TO|$NGX_FORWARD_TO|g" /etc/nginx/sites-enabled/default
exec nginx -g "daemon off;"