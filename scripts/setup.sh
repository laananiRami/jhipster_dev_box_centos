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
su -c "yarn config set prefix /home/vagrant/.yarn-global" vagrant

# install yeoman grunt bower gulp
su -c "yarn global add yo bower gulp" vagrant

# install JHipster
su -c "yarn global add generator-jhipster" vagrant

# install JHipster UML
su -c "yarn global add jhipster-uml" vagrant


################################################################################
# Install the development tools
################################################################################

# install ruby (for heroku)
yum -y install ruby

# install Heroku toolbelt
su -c "wget -qO https://toolbelt.heroku.com/install.sh | sh" vagrant

heroku = "whereis  heroku"

echo "$heroku"

echo '"PATH=$heroku:$PATH"' >> /etc/profile.d/heruko.sh
source /etc/profile.d/heruko.sh


# install Guake
#apt-get install -y guake
#cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

# install jhipster-devbox
#git clone git://github.com/jhipster/jhipster-devbox.git /home/vagrant/jhipster-devbox
#chmod +x /home/vagrant/jhipster-devbox/tools/*.sh



# install zsh
sudo yum -y install  zsh


# install Visual Studio Code
su -c 'umake ide visual-studio-code /home/vagrant/.local/share/umake/ide/visual-studio-code --accept-license' vagrant


#install IDEA community edition
su -c 'umake ide idea /home/vagrant/.local/share/umake/ide/idea' vagrant






# install latest Docker
curl -sL https://get.docker.io/ | sh

# install latest docker-compose
curl -L "$(curl -s https://api.github.com/repos/docker/compose/releases | grep browser_download_url | head -n 4 | grep Linux | cut -d '"' -f 4)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# configure docker group (docker commands can be launched without sudo)
usermod -aG docker vagrant

# fix ownership of home
chown -R vagrant:vagrant /home/vagrant/
################################################################################
# Install the graphical environment
################################################################################

# force encoding
 echo 'LANG=en_US.UTF-8' >> /etc/environment
 echo 'LANGUAGE=en_US.UTF-8' >> /etc/environment
 echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
 echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment

# # run GUI as non-privileged user
 echo 'allowed_users=anybody' > /etc/X11/Xwrapper.config

# # install Ubuntu desktop and VirtualBox guest tools
 yum -y install  virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# yum -y groups install "GNOME desktop"
# startx

# clean the box
yum -y autoclean
yum -y clean
yum -y autoremove
dd if=/dev/zero of=/EMPTY bs=1M > /dev/null 2>&1
rm -f /EMPTY