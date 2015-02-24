Vagrant-Phalcon-Nginx
=====================

##Vagrant/Puppet to build a phalcon-php/ngnix development server.

##Installed

Ubuntu Trusty32 base box

nginx

php5-fpm

[Phalcon](http://phalconphp.com) built from Github repo and installed

SQLite3

##Note
This compiles Phalcon from source, it may take a while. To avoid this every time, just halt the machine rather than destroying it.

##Use
`http://localhost:8080` with a web root of `public` relative to the Vagrantfile.

##Why?
Because I couldn't find a working one, and I needed a super lightweight testing environment.

