#!/bin/bash

directories=(
        "/etc/nginx/nginx.conf"
        "/etc/letsencrypt/config/domain.conf"
        "/etc/nginx/common/ssl.conf"
)

for directory in ${directories[*]}
do
        [ -z "${DOMAIN}" ] && echo "\$DOMAIN is not set" || sed -i "s/DOMAIN/${DOMAIN}/" $directory
done

[ -z "${EMAIL}" ] && echo "\$EMAIL is not set" || sed -i "s/EMAIL/${EMAIL}/" /etc/letsencrypt/config/domain.conf

printf "SERVER PORT: $NGINX_SERVER_PORT \n"
[ -z "${NGINX_SERVER_PORT}" ] && echo "\$NGINX_SERVER_PORT is not set" || sed -i "s/NGINX_SERVER_PORT/${NGINX_SERVER_PORT}/" /etc/nginx/nginx.conf

printf "SERVER DOMAIN: $NGINX_SERVER_NAME \n"
[ -z "${NGINX_SERVER_NAME}" ] && echo "\$NGINX_SERVER_NAME is not set" || sed -i "s/NGINX_SERVER_NAME/${NGINX_SERVER_NAME}/" /etc/nginx/nginx.conf

printf "COMPRESSION: $COMPRESSION"
if [ "$COMPRESSION" == "brotli" ]
        then
            [ -z "${COMPRESSION}" ] && echo "\$COMPRESSION is not set" || sed -i "s/COMPRESSION/brotli.conf/" /etc/nginx/nginx.conf
        else
            [ -z "${COMPRESSION}" ] && echo "\$COMPRESSION is not set" || sed -i "s/COMPRESSION/gzip.conf/" /etc/nginx/nginx.conf
fi

/usr/sbin/nginx -g "daemon off;"
