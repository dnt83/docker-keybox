#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  apt-get update && apt-get install -qy git maven
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  rm -rf /opt/keybox
  git clone https://github.com/skavanagh/KeyBox.git /opt/keybox
  mvn -f /opt/keybox/pom.xml dependency:copy-dependencies package
fi
