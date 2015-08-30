FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/log/nginx"]

# Add our configuration.
ADD nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx

EXPOSE 80 443

CMD ["/usr/sbin/nginx"]
