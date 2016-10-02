bucketPath=
current=$(shell date "+%Y%m%d-%H")

all:
	rm -rf ./world
	cp -rf /home/minecraft/world ./
	tar cfvz world$(current).tar.gz ./world
	aws world$(current).tar.gz $(bucketPath)/
