#!/bin/sh

# update the system
yum update
yum upgrade

################################################################################
# Install the mandatory tools
################################################################################

export LANGUAGE='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# install utilities
yum -y install vim git zip bzip2 fontconfig curl language-pack-en

pwd

# install Java 8
#chmod +x scripts/*.sh
#source scripts/jdk-install.sh
#install maven 3
#source scripts/maven-install.sh



# install build tools
yum -y install  wget gcc-c++ make tar unzip python g++ build-essential gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

# install node.js
curl -sL https://rpm.nodesource.com/setup_7.x | bash -
yum -y install  nodejs 

# update npm
npm install -g npm

# install yarn
npm install -g yarn
yarn config set prefix /home/vagrant/.yarn-global

# install yeoman grunt bower gulp
npm install -g yo bower gulp

# install JHipster
npm install -g generator-jhipster


# install JHipster UML
npm install -g jhipster-uml


################################################################################
# Install the development tools
################################################################################

# install latest Docker
curl -sL https://get.docker.io/ | sh

# install latest docker-compose
curl -L "$(curl -s https://api.github.com/repos/docker/compose/releases | grep browser_download_url | head -n 4 | grep Linux | cut -d '"' -f 4)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# configure docker group (docker commands can be launched without sudo)
usermod -aG docker vagrant


# clean the box
yum -y autoclean
yum -y clean
yum -y autoremove
dd if=/dev/zero of=/EMPTY bs=1M > /dev/null 2>&1
rm -f /EMPTY