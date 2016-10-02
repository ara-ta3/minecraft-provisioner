.PHONY: scripts.tar.gz

PACKER=$(shell which packer)
packer_template=./packer.json
var_file=packer_var_file.json

packer_validate:
	$(PACKER) validate $(packer_template)

packer_build: scripts.tar.gz
	$(PACKER) build \
		-var-file=$(var_file) \
		$(packer_template)

scripts.tar.gz: scripts
	rm -f $@
	tar cfvz $@ $<

restart_minecraft:
		systemctl restart minecraft

status_minecraft:
		systemctl status minecraft

show_log_minecraft:
		journalctl -u minecraft

daemon_reload:
		systemctl daemon-reload

