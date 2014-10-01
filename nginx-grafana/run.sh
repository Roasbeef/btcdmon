#!/bin/bash

# Replace placeholder with actual password from container linking.
sed -i "s/DB_PASSWORD/$INFLUXDB_ENV_INFLUXDB_DEFAULT_DB_PASSWORD/g" /root/grafana/config.js

exec /usr/sbin/nginx

fg
