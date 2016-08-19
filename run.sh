#!/bin/bash

# if [ "$(uname)" == "Darwin" ]; then
#     # Mac OS X platform
#     NGINX_SERVER_NAME=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#     # GNU/Linux platform
#     NGINX_SERVER_NAME=$(ip route get 1 | awk '{print $NF;exit}')
# # elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
#     # Windows NT platform
# fi

##echo -e "ENTER DOMAIN"
##read domain
##echo -e "ENTER NEW DOMAIN"
##read new_domain
##echo -e "ENTER EMAIL ADDRESS"
##read email
##echo -e "ENTER COMPRESSION: brotli or gzip"
##read compression

##[ -z "${domain}" ] && echo "\$domain is not set" || sed -i "s/default_domain/${domain}/" ./docker-compose.yml
##[ -z "${new_domain}" ] && echo "\$new_domain is not set" || sed -i "s/new_domain/${new_domain}/" ./docker-compose.yml
##[ -z "${email}" ] && echo "\$email is not set" || sed -i "s/email/${email}/" ./docker-compose.yml
##[ -z "${compression}" ] && echo "\$compression is not set" || sed -i "s/compression_type/${compression}/" ./docker-compose.yml
cp ./nitra/procedure1_issueid62999.conf ./nginx/nginx.conf

docker-compose build
docker-compose up -d
