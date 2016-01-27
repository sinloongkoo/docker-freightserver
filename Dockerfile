FROM centos:centos7
MAINTAINER: BringTheDip.com Technical Team <devops@bringthedip.com>

# Update all installed packages to make sure system is tip-top.
RUN yum -y update;  \
    yum clean all;

# Install OpenJDK 1.8.x, which and GIT
RUN yum -y install \
    which \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel \
    git

# Install redis from the EPEL repo
RUN yum -y install epel-release; 
    yum -y redis;

# Redirect output from log file to STDout.    
RUN sed -i 's/^\(logfile\s*\).*$/\1""/g' /etc/redis.conf

# Install NodeJS 5.x Latest RPM Source
RUN yum -y install \
    gcc-c++ \
    make
RUN	curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
RUN yum -y install nodejs

# Install freight to /app
RUN cd /           && \
    mkdir app      && \
    cd app         && \
    git clone https://github.com/vladikoff/freight-server.git . && \
    npm install

CMD ["npm", "start"]
EXPOSE 8872