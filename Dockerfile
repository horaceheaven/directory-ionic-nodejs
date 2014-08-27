FROM fedora:latest  
MAINTAINER Sigismond McLaughlin "smclaughlin@medullan.com"  
  
#RUN yum -y update  
RUN yum -y install openssh-server  
RUN yum -y install supervisor  
RUN yum -y install java-1.7.0-openjdk
  
RUN     rpm -Uvh http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
RUN yum -y install nodejs npm --enablerepo=epel
RUN yum -y install git
RUN echo "root:password" | chpasswd  
RUN useradd jenkins  
RUN echo "jenkins:jenkins" | chpasswd  
  
RUN mkdir -p /var/run/sshd  
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''  
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd  

RUN yum -y install python-pip
  
RUN mkdir -p /var/run/supervisord  
ADD supervisord.conf /etc/supervisord.conf  
ADD requirements.txt /opt/requirements.txt
ADD directory-app.service /etc/systemd/system/directory-app.service

#RUN systemctl enable directory-app
#RUN systemctl start directory-app

RUN pip install -r /opt/requirements.txt  
RUN yum -y install fontconfig freetype libfreetype.so.6 libfontconfig.so.1 libstdc++.so.6
RUN yum -y install wget
RUN yum -y install bzip2
RUN cd /opt
RUN wget -O /opt/phantomjs-1.9.7-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN tar xvf /opt/phantomjs-1.9.7-linux-x86_64.tar.bz2 -C /opt
RUN ln -s /opt/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN yum -y install xorg-x11-server-Xvfb.x86_64
RUN yum -y install firefox.x86_64
COPY . /src
RUN cd /src; npm install

RUN /usr/bin/supervisord &

EXPOSE 22  
CMD ["echo up"]
