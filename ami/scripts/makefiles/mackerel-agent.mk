all:
	curl -fsSL https://mackerel.io/assets/files/scripts/setup-apt.sh | sh
	apt-get install -y mackerel
