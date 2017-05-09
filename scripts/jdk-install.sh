#DESCRIPTION:The script to install jdk-install 7 or 8
#SOURCE=http://thelinuxfaq.com/213-install-java-7-jdk-7u60-java-8-jdk-8u25-in-centos-fedora-rhel
#USAGE :/bin/bash jdk-install.sh
 
#JDK-Functions
function JDK_VERSION_EIGHT
{
        echo "Install version jdk-8u25-linux-x64"
		mkdir /usr/java 
		cd /usr/java
        wget -O /usr/java/jdk-8u121-linux-x64.tar.gz --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz" 
        tar xzf jdk-8u121-linux-x64.tar.gz
		#rm jdk-8u121-linux-x64.tar.gz
		#mv /root/jdk1.8* /usr/java/
        #rpm -Uvh jdk-8u45-linux-x64.rpm
        #rpm -Uvh jre-8u45-linux-x64.rpm 
		echo -e 'export JAVA_HOME=/usr/java/jdk1.8.0_121\nexport PATH=${PATH}:$JAVA_HOME/bin'> /etc/profile.d/java.sh
		source /etc/profile.d/java.sh
		echo " Check the JAVA_HOME path"
		java -version
		echo " JAVA_HOME"
		echo $JAVA_HOME
		echo "PATH"
        echo $PATH
		
		
}
 
echo "Install JDK 8 "
echo "~~~~~~~~~~~~~~~~~~~~~~"
 
if [ -f "rpm -qa | grep glibc" ]; then
yum install glibc.i686 -y
fi
if [ -f "rpm -qa | grep libgcc" ]; then
yum install libgcc-* -y
fi
 
if [ -f "/usr/java/jdk" ]; then
echo "JAVA Already Installed in Your System"
else
      JDK_VERSION_EIGHT
      
fi
##############################################
