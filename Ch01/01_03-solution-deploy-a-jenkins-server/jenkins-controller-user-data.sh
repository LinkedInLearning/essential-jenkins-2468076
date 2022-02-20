#!/bin/bash
# vi: ft=bash

echo "# $(date) Installation is starting."
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

# install java, nginx, and jenkins
apt update
apt-get -qq upgrade

apt-get -qq install \
    openjdk-11-jdk \
    nginx \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

apt-get -qq install jenkins

# configure jenkins

## skip the installation wizard at startup
echo "JAVA_ARGS=\"-Djenkins.install.runSetupWizard=false\"" >> /etc/default/jenkins

## download the list of plugins
wget https://raw.githubusercontent.com/jenkinsci/jenkins/master/core/src/main/resources/jenkins/install/platform-plugins.json

## get the suggested plugins
grep suggest platform-plugins.json | cut -d\" -f 4 | tee suggested-plugins.txt

## download the plugin installation tool
wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.3/jenkins-plugin-manager-2.12.3.jar

## run the plugin installation tool
/usr/bin/java -jar ./jenkins-plugin-manager-2.12.3.jar \
	--verbose \
    --plugin-download-directory=/var/lib/jenkins/plugins \
    --plugin-file=./suggested-plugins.txt >> /var/log/plugin-installation.log

## because the plugin installation tool runs as root, ownership on
## the plugin dir needs to be changed back to jenkins:jenkins
## otherwise, jenkins won't be able to install the plugins
chown -R jenkins:jenkins /var/lib/jenkins/plugins

# configure nginx
unlink /etc/nginx/sites-enabled/default

tee /etc/nginx/conf.d/jenkins.conf <<EOF
upstream jenkins {
    server 127.0.0.1:8080;
}

server {
    listen 80 default_server;
    listen [::]:80  default_server;
    location / {
        proxy_pass http://jenkins;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

systemctl reload nginx

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt-get -qq install docker-ce docker-ce-cli containerd.io
docker run hello-world

systemctl enable docker.service
systemctl enable containerd.service

usermod -aG docker ubuntu
usermod -aG docker jenkins

systemctl restart jenkins
cp /var/lib/jenkins/secrets/initialAdminPassword ~
echo "$(date) Installation is complete."
