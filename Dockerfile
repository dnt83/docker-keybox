FROM dockerfile/java:oracle-java8

MAINTAINER Diego Schmidt <dceschmidt@gmail.com>

RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update && apt-get install -y git maven

# Clone project
WORKDIR /code
RUN git clone https://github.com/skavanagh/KeyBox.git
WORKDIR /code/KeyBox
RUN mvn package

# Expose the http port
expose 8443

# run
WORKDIR /code/KeyBox
CMD mvn jetty:run
