FROM openresty/openresty:stretch-fat
RUN apt-get update && apt-get  install -y logrotate && \
  openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 4096 && \
  apt-get update && apt-get install -y openssl && \
  mkdir /etc/nginx/ssl && \
  openssl req -x509 -nodes -days 365 \
    -newkey rsa:4096 -keyout /etc/nginx/ssl/privkey.pem -out /etc/nginx/ssl/fullchain.pem -subj \
    '/C=UA/ST=Ukraine/L=Kharkiv/CN=test.com'
