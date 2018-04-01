
FROM debian:jessie

LABEL maintainer="MICHAEL@KTH.SE"

ENV EDITOR vim

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
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
      nano \
      openssh-client \
      jq && \
      echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ jessie main" | tee /etc/apt/sources.list.d/azure-cli.list && \
     apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 && \
     apt-get update -qq && \
     apt-get install -qqy --no-install-recommends azure-cli && \
     curl https://bootstrap.pypa.io/get-pip.py > get-pip.py && \
     python get-pip.py && \ 
     rm -f get-pip.py && \
     pip install --upgrade pip netaddr==0.7.18 cryptography cffi ansible --no-cache-dir && \
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
      apt-get purge -y $(apt-cache search '~c' | awk '{ print $2 }') && \
      apt-get -y autoclean && \
      apt-get -y clean all && \
      rm -rf /root/.cache/pip && \
      rm -rf /root/.pip/cache && \
      rm -rf /var/lib/apt/lists/* && \
      rm -rf /var/cache/apt && \
      rm -rf /tmp/*

