ROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Add our configuration.
ADD nginx.conf /etc/nginx/nginx.conf

# Create directory where our static dashboard files will live.
RUN mkdir /root/grafana

# Add in our dashboard config.
ADD config.js /root/grafana/config.js

# Install grafana.
ADD install-grafana.sh /install-grafana.sh
RUN chmod +x /*.sh
WORKDIR /root/grafana
RUN /install-grafana.sh
RUN chmod o+x /root/grafana

RUN mkdir -p /var/log/nginx

WORKDIR /

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/nginx"]
