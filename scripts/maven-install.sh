#DESCRIPTION:The script to install MAVEN 3
#SOURCE=https://github.com/monksy/centos-maven-install/blob/master/maven-install.sh
#USAGE :/bin/bash maven-install.sh
TEMPORARY_DIRECTORY="/opt/"
DOWNLOAD_TO="/opt/maven.tar.gz"
echo "$DOWNLOAD_TO"
wget -O "$DOWNLOAD_TO" http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
echo 'Extracting Maven'
tar xzf /opt/maven.tar.gz
rm $DOWNLOAD_TO
echo 'Configuring Envrionment'
mv /opt/apache-maven-* /usr/local/maven
echo -e 'export M2_HOME=/usr/local/maven\nexport PATH=${M2_HOME}/bin:${PATH}' > /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
 #not sure about how to set the current environment under the sudo
 #sudo -u "$SUDO_USER" env  "M2_HOME=/usr/local/maven"
 #sudo -u "$SUDO_USER" env "PATH=/usr/local/maven/bin:${PATH}"
 echo 'The maven version: ' `mvn -version` ' has been installed.'
 echo -e '\n\n!! Note you must relogin to get mvn in your path !!'
 echo 'Removing the temporary directory...'
 #rm -r "$TEMPORARY_DIRECTORY/"
 echo 'Your Maven Installation is Complete.'
