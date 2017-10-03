# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

prepare:
	@echo preparing frosted
	if [ ! -d $(BUILD_DIR)/frosted ]; then \
	cd $(BUILD_DIR) ;\
		git clone https://github.com/insane-adding-machines/frosted.git ;\
		cd frosted ;\
		git submodule update --init --recursive ;\
	fi
	cp $(BUILD_DIR)/.frosted $(BUILD_DIR)/frosted/kconfig/.config
	cp $(BUILD_DIR)/.frostedapps $(BUILD_DIR)/frosted/frosted-userland/kconfig/.config

compile:
	PATH='$(HOST_PATH)' $(MAKE) V=1 -C $(BUILD_DIR)/frosted clean
	@echo compiling frosted userland
	PATH='$(HOST_PATH)' $(MAKE) V=1 -C $(BUILD_DIR)/frosted/frosted-userland
	@echo compiling frosted kernel
	PATH='$(HOST_PATH)' $(MAKE) V=1 -C $(BUILD_DIR)/frosted

install:
	@echo installing frosted
	cp $(BUILD_DIR)/frosted/image.bin $(FW_DIR)
