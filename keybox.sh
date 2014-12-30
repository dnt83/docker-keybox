#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  cd /opt/keybox/jetty
  exec java -jar start.jar
else
  mvn -f /opt/keybox/pom.xml jetty:run
fi