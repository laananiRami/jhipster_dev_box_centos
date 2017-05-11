################################################################################
# Install the development tools
################################################################################

# install ruby (for heroku)
yum -y install ruby

# install Heroku toolbelt
wget https://toolbelt.heroku.com/install.sh -O - | sh

heroku = "whereis  heroku"

echo $heroku


echo -e 'export PATH=/usr/local/heroku/bin:${PATH}' > /etc/profile.d/heroku.sh
source /etc/profile.d/heroku.sh

heroku