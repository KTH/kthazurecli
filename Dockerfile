FROM debian:jessie

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends \
      apt-transport-https \
      build-essential \
      curl \
      ca-certificates \
      git \
      lsb-release \
      python-all \
      rlwrap \
      vim \
      nano \
      python-pip\
      ansible \
      jq && \
     pip install netaddr==0.7.18 && \
     curl https://deb.nodesource.com/node_6.x/pool/main/n/nodejs/nodejs_6.11.2-1nodesource1~jessie1_amd64.deb > node.deb && \
     dpkg -i node.deb && \
      rm node.deb && \
      npm install --global azure-cli && \
      azure --completion >> ~/azure.completion.sh && \
      echo 'source ~/azure.completion.sh' >> ~/.bashrc && \
      azure telemetry --disable && \
      azure config mode arm && \
      apt-get update -qq && \
      apt-get autoremove -qqy && \
      apt-get clean -qqy && \
      apt-get purge -qqy && \
      apt-get purge -y $(apt-cache search '~c' | awk '{ print $2 }') && \
      apt-get -y autoclean && \
      apt-get -y clean all && \
      rm -rf /root/.cache/pip && \
      rm -rf /root/.pip/cache && \
      rm -rf /var/lib/apt/lists/* && \
      rm -rf /var/cache/apt && \
      rm -rf /tmp/*
ENV EDITOR vim

LABEL maintainer="MICHAEL@KTH.SE"
