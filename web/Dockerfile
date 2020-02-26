FROM jason3e7/ubuntu:latest
LABEL maintainer="jason3e7 <jason3e7@gmail.com>"

RUN set -x \
  && apt-get update -y && apt-get update -y \
  && apt-get install --no-install-recommends --no-install-suggests -y nginx \
  && apt-get install --no-install-recommends --no-install-suggests -y mysql-server \
  && apt-get install --no-install-recommends --no-install-suggests -y gnupg \
  && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates apt-transport-https \ 
  && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
  && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list \
  && apt-get update -y \
  && apt-get install --no-install-recommends --no-install-suggests -y php5.6-fpm php5.6-mysql 

ENV MYSQLUSER="test" MYSQLPASS="test"

RUN set -x \
  && mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_bak 

COPY nginx_sites_default.txt /etc/nginx/sites-available/default
COPY webRoot/setupCheck.php /var/www/html/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -x \
  && chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

