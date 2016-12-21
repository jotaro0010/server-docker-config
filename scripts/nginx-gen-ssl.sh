openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout /opt/docker/containers/nginx/ssl/private/key.pem -out /opt/docker/containers/nginx/ssl/certs/cert.pem
openssl dhparam -out /opt/docker/containers/nginx/ssl/certs/dhparam.pem 4096
