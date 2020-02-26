#!/bin/bash

/etc/init.d/nginx start
/etc/init.d/mysql start 
/etc/init.d/php5.6-fpm start 

mysql -e "CREATE USER IF NOT EXISTS '$MYSQLUSER'@'%' IDENTIFIED BY '$MYSQLPASS';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQLUSER'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

if grep -q '$MYSQLUSER' /var/www/html/setupCheck.php; then
  sed 's/$MYSQLUSER/'"$MYSQLUSER"'/' /var/www/html/setupCheck.php > /var/www/html/setupCheckSetup.php
  sed 's/$MYSQLPASS/'"$MYSQLPASS"'/' /var/www/html/setupCheckSetup.php > /var/www/html/setupCheck.php
  rm /var/www/html/setupCheckSetup.php
fi

echo "host/setupCheck.php, check steup"
echo "MYSQLUSER : $MYSQLUSER, MYSQLPASS : $MYSQLPASS"
/usr/bin/tail -f /dev/null
