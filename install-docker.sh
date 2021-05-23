#!/bin/bash

# pm
if [ -f "/usr/bin/yum" ] && [ -d "/etc/yum.repos.d" ]; then
    PM="yum"
elif [ -f "/usr/bin/apt-get" ] && [ -f "/usr/bin/dpkg" ]; then
    PM="apt-get"            
fi

# curl install
if [ ! -f "/usr/bin/curl" ];then
    ${PM} install -y curl
fi

# curl instal docker
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# chage docker hub
mkdir -p /etc/docker
echo "{
    \"registry-mirrors\" :[
        \"https://registry.docker-cn.com\",
        \"http://hub-mirror.c.163.com\",
        \"https://docker.mirrors.ustc.edu.cn\"
    ]
}" >>/etc/docker/daemon.json

# start
systemctl start docker

# docker-composer https://github.com/docker/compose/releases/
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

