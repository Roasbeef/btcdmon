#!/bin/bash

GRAFANA_VER=grafana-1.8.0-rc1
GRAFANA_PKG=$GRAFANA_VER.tar.gz
GRAFANA_URL=http://grafanarel.s3.amazonaws.com/$GRAFANA_PKG

# Download the latest grafana version
wget $GRAFANA_URL
tar xvfz $GRAFANA_PKG
cp -r $GRAFANA_VER/* .
rm -r $GRAFANA_VER

rm config.sample.js

# Replace placeholder with actual password from container linking.
sed -i 's/DB_PASSWORD/${INFLUXDB_ENV_INFLUXDB_DEFAULT_DB_PASSWORD}/g' config.js
