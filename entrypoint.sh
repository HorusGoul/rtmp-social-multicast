#!/bin/bash

/workdir/create-nginx-conf.sh /etc/nginx/nginx.conf

nginx -g "daemon off;"