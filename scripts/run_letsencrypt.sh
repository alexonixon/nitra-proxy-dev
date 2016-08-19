#!/bin/bash

echo "RUNNING LETSENCRYPT FOR $DOMAIN"
# cd /opt/letsencrypt
# ./letsencrypt-auto certonly --standalone --agree-tos --config /etc/letsencrypt/config/domain.conf --text

# ec=$?

# if [ $ec -ne 0 ]
#     then
#         echo -e "THE CERTIFICATE HAS NOT BEEN RECEIVED! \n \n"
#         exit 1
#     else
#         /usr/sbin/nginx -g "daemon off;"
#         echo -e "THE CERTIFICATE HAS BEEN RECEIVED"
# fi
