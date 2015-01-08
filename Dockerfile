FROM ubuntu:latest
MAINTAINER Horace Heaven "hheaven@medullan.com"

# Update software package
RUN apt-get -y update

# Install nodejs programs
RUN apt-get -y install nodejs=0.10.25~dfsg2-2ubuntu1 nodejs-legacy npm

EXPOSE 5000

COPY . /src

CMD cd /src; npm install; npm start
