FROM debian:wheezy
 
# Install InfluxDB
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends curl ca-certificates && \
  curl -s -o /tmp/influxdb_latest_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb && \
  dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm /tmp/influxdb_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

ADD config.toml /config/config.toml
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV INFLUXDB_DEFAULT_DB_NAME btcd
ENV INFLUXDB_DEFAULT_DB_USER btcdmon
ENV INFLUXDB_DEFAULT_DB_PASSWORD **None**
ENV INFLUXDB_ROOT_PASSWORD **ChangeMe**

# Admin server
EXPOSE 8083

# HTTP API
EXPOSE 8086

# InfluxDB UDP port (incoming metrics from our btcd node).
EXPOSE 4444/udp

# HTTPS API
#EXPOSE 8084

# Raft port (for clustering, don't expose publicly!)
#EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
#EXPOSE 8099

# Time series data will be stored here.
VOLUME ["/data"]

CMD ["/run.sh"]
