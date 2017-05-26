#!/bin/sh

chown -Rf nginx:nginx /appps

# Start supervisord and services
/usr/bin/supervisord -n -c /etc/supervisord.conf