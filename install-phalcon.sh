#! /bin/bash

cd /tmp

git clone git://github.com/phalcon/cphalcon.git
cd cphalcon/build
sudo ./install

sudo sed -i '$a extension="phalcon.so"' /etc/php5/fpm/php.ini 

sudo service php5-fpm restart
sudo service nginx restart

