all: /etc/systemd/system/minecraft.service

/opt/minecraft_server.jar:/opt/forge-installer
	mkdir -p /opt/mods
	cd /opt && java -jar $< --installServer
	mv -f forge-1.11-13.19.0.2154-universal.jar $@

/opt/forge-installer:
	wget -O $@ https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11-13.19.0.2154/forge-1.11-13.19.0.2154-installer.jar

/home/minecraft: minecraft
		mkdir -p $@
		mkdir -p $@/mods
		chown -R minecraft:minecraft $@

minecraft:
		id -u $@ > /dev/null || adduser $@

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
