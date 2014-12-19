FROM dockerfile/java:oracle-java8

MAINTAINER Diego Schmidt <dceschmidt@gmail.com>

# Download keybox
WORKDIR /application
ADD https://github.com/skavanagh/KeyBox/releases/download/v2.50.02/keybox-jetty-v2.50_02.tar.gz /application/ 
RUN tar -zxf keybox-jetty-v2.50_02.tar.gz
RUN rm keybox-jetty-v2.50_02.tar.gz

# Expose the http port
expose 8443

# run
WORKDIR /application/KeyBox-jetty/jetty
CMD java -jar start.jar
