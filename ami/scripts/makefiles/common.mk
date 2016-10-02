all: timezone package

package:
	apt update
	apt upgrade

timezone:
	echo "Asia/Tokyo" > /etc/timezone    
	dpkg-reconfigure -f noninteractive tzdata
