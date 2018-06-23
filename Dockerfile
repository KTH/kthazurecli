
FROM debian:stretch

LABEL maintainer="MICHAEL@KTH.SE"

ENV EDITOR vim

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update -qq && \
    apt-get dist-upgrade -y && \
    apt-get install -qqy --no-install-recommends \
      apt-utils \
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
      gnupg \
      dialog \
      jq && \
      AZ_REPO=$(lsb_release -cs) && \
      echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list && \
     curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
     apt-get update -qq && \
     apt-get install -qqy --no-install-recommends azure-cli && \
     curl https://bootstrap.pypa.io/get-pip.py > get-pip.py && \
     python get-pip.py && \ 
     rm -f get-pip.py && \
     pip install --upgrade pip netaddr==0.7.18 cryptography cffi ansible --no-cache-dir && \
     curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
     apt-get install -y nodejs -qqy \
     npm install npm --global --upgrade \
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
      rm -rf /usr/share/locale/* && \
      rm -rf /var/cache/debconf/*-old && \
      rm -rf /var/lib/apt/lists/* && \
      rm -rf /usr/share/doc/* && \
      rm -rf /tmp/*

