# This is a comment
FROM ubuntu:14.04
MAINTAINER Diego Schmidt <dceschmidt@gmail.com>
RUN apt-get update && apt-get install -y ruby ruby-dev
RUN gem install sinatra
