all: /etc/systemd/system/minecraft.service

/opt/minecraft_server.jar:
		wget -O $@ https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar

/home/minecraft: minecraft
		mkdir -p $@
		chown minecraft:minecraft $@

minecraft:
		id -u $@ > /dev/null || adduser $@
		@echo "minecraft"|passwd --stdin $@

/etc/systemd/system/minecraft.service:/opt/minecraft_server.jar /home/minecraft
		echo "$$minecraft_service" > $@

define minecraft_service
[Unit]
Description=Minecraft Server
After=network-online.target

[Service]
ExecStart=/usr/bin/java -Xms768M -Xmx768M -jar /opt/minecraft_server.jar nogui
WorkingDirectory=/home/minecraft/
Restart=always
User=minecraft
Group=minecraft

[Install]
WantedBy=multi-user.target
endef
export minecraft_service
