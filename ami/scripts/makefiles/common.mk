all: timezone package awscli java

package:
	apt update
	apt-get -y upgrade

timezone:
	echo "Asia/Tokyo" > /etc/timezone    
	dpkg-reconfigure -f noninteractive tzdata

awscli:
	apt-get install -y awscli

java:
	apt-get install -y openjdk-8-jre-headless
