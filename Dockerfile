# Using https://github.com/phusion/baseimage-docker as a base image
FROM phusion/baseimage:latest
MAINTAINER Diego Schmidt <dceschmidt@gmail.com>

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Java 8.
RUN apt-get update \
    && apt-get install -y default-jdk

# Download keybox
ADD https://github.com/skavanagh/KeyBox/releases/download/v2.86.00/keybox-jetty-v2.86_00.tar.gz /opt/
RUN tar -zxf /opt/keybox-jetty-v2.85_03.tar.gz -C /opt
RUN mv /opt/KeyBox-jetty /opt/keybox
RUN rm /opt/keybox-jetty-v2.85_03.tar.gz

# Expose the http port
expose 8443

# Add edge.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD edge.sh /etc/my_init.d/edge.sh
RUN chmod +x /etc/my_init.d/edge.sh

# Add Keybox to runit
RUN mkdir /etc/service/keybox
ADD keybox.sh /etc/service/keybox/run
RUN chmod +x /etc/service/keybox/run
VOLUME /opt/keybox/jetty/keybox/WEB-INF/classes/keydb

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
