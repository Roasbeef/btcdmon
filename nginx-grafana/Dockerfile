FROM nginx

# Add our configuration.
ADD nginx.conf /etc/nginx.conf

# Create directory where our static dashboard files will live.
RUN mkdir /root/grafana

# Add in our dashboard config.
ADD config.js /root/grafana/config.js

# Install grafana.
WORKDIR /root/grafana
ADD install-grafana.sh /install-grafana.sh
RUN chmod +x /*.sh
RUN install-grafana.sh

WORKDIR /
