#!/usr/bin/env bash

#install nginx if not installed
which nginx 
if [ $? -ne 0 ]; then
  apt-get update
  apt-get install -y nginx
fi

#delete default conf
rm /etc/nginx/sites-enabled/default 

#cd into /vagrant if we are on vagrant
[ -d /vagrant ]  && pushd  /vagrant/

#copy our conf file
cp nginx.conf /etc/nginx/sites-enabled/default 

#reload nginx to use our conf file
service nginx reload
