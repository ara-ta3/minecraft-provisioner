all: timezone package

package:
	apt update
	apt-get -y upgrade

timezone:
	echo "Asia/Tokyo" > /etc/timezone    
	dpkg-reconfigure -f noninteractive tzdata
