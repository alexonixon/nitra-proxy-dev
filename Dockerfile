FROM nitra/docker-nginx-pagespeed

RUN git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

#RUN cd /etc && mkdir letsencrypt
COPY ./letsencrypt /etc/letsencrypt

RUN mkdir -p /var/www/letsencrypt && \
    chgrp www-data /var/www/letsencrypt

COPY ./nginx/common /etc/nginx/common
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab

CMD ["cron -f"]