cd /opt/letsencrypt
./letsencrypt-auto certonly --standalone --agree-tos --renew-by-default --config /etc/letsencrypt/config/domain.conf --text

if [ $? -ne 0 ]
    then
        ERRORLOG=`tail /var/log/letsencrypt.log`
        echo -e "THE LET'S ENCRYPT HAS NOT BE RENEWED! \n \n" $ERRORLOG
    else
        nginx -s reload
        echo -e "THE CERTIFICATE HAS BEEN UPDATED \n \n"
fi

exit 0