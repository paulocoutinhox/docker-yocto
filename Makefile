ROOT_DIR = $(shell pwd)

.DEFAULT_GOAL := help

# general
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- build-docker-image"
	@echo "- run cmd=\"ls -lah\""
	@echo "- bash"
	@echo "- get-yocto"
	@echo "- update-yocto-metadata"
	@echo "- get-rpi3-yocto"
	@echo "- build-rpi3"
	@echo "- clean-all"
	@echo ""

build-docker-image:
	docker build -t prsolucoes_yocto .

run:
	mkdir -p "$(ROOT_DIR)/shared"
	mkdir -p "$(ROOT_DIR)/shared/yocto"

	docker run \
	-v "$(ROOT_DIR)/shared":/shared \
	-it prsolucoes_yocto \
	/bin/bash -c "$(cmd)"

bash:
	mkdir -p "$(ROOT_DIR)/shared"
	mkdir -p "$(ROOT_DIR)/shared/yocto"

	docker run \
	-v "$(ROOT_DIR)/shared":/shared \
	-it prsolucoes_yocto \
	/bin/bash

get-yocto:
	mkdir -p "$(ROOT_DIR)/shared"
	mkdir -p "$(ROOT_DIR)/shared/yocto"

	make run cmd="cd /shared/yocto && git clone -b rocko git://git.yoctoproject.org/poky"

update-yocto-metadata:
	make run cmd="cd /shared/yocto/poky && git pull --all --prune"

get-rpi3-yocto:
	mkdir -p "$(ROOT_DIR)/shared"
	mkdir -p "$(ROOT_DIR)/shared/yocto"
	mkdir -p "$(ROOT_DIR)/shared/rpi3-custom"

	-make run cmd="cd /shared/yocto && git clone -b rocko git://git.openembedded.org/meta-openembedded"
	-make run cmd="cd /shared/yocto && git clone -b rocko git://git.yoctoproject.org/meta-raspberrypi"
	-make run cmd="cd /shared/yocto && git clone -b rocko https://github.com/meta-qt5/meta-qt5"
	-make run cmd="cd /shared/yocto && git clone -b rocko git://git.yoctoproject.org/meta-security"

	-make run cmd="cd /shared/rpi3-custom && git clone -b rocko git://github.com/jumpnow/meta-rpi"
	-make run cmd="cd /shared/yocto/poky && source oe-init-build-env /shared/rpi3-custom/build"

	-make run cmd="cd /shared/rpi3-custom/build && cp -n /shared/rpi3-custom/meta-rpi/conf/local.conf.sample conf/local.conf"
	-make run cmd="cd /shared/rpi3-custom/build && cp -n /shared/rpi3-custom/meta-rpi/conf/bblayers.conf.sample conf/bblayers.conf"

build-rpi3:
	make run cmd="source /shared/yocto/poky/oe-init-build-env /shared/rpi3-custom/build; cd /shared/rpi3-custom/build; bitbake qt5-image"

clean-all:
	rm -rf "$(ROOT_DIR)/shared/rpi3-custom/build/cache"
	rm -rf "$(ROOT_DIR)/shared/rpi3-custom/build/sstate-cache"
	rm -rf "$(ROOT_DIR)/shared/rpi3-custom/build/tmp"
	rm -f  $(ROOT_DIR)/shared/rpi3-custom/build/*.log
	