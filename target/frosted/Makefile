# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

prepare:
	if [ ! -d $(BUILD_DIR)/frosted ]; then \
	cd $(BUILD_DIR) ;\
		git clone https://github.com/insane-adding-machines/frosted.git ;\
		cd frosted ;\
		git submodule update --init --recursive ;\
	fi
	cp $(BUILD_DIR)/.frosted $(BUILD_DIR)/frosted/kconfig/.config
	cp $(BUILD_DIR)/.frostedapps $(BUILD_DIR)/frosted/frosted-userland/kconfig/.config

compile:
	PATH='$(HOST_PATH)' $(MAKE) V=1 -C $(BUILD_DIR)/frosted/frosted-userland $(MAKE_TRACE)
	PATH='$(HOST_PATH)' $(MAKE) V=1 -C $(BUILD_DIR)/frosted $(MAKE_TRACE)

install:
	@cp $(BUILD_DIR)/frosted/image.bin $(FW_DIR)

targethelp:
	@echo "Use following command to flash:"
	@echo "$(STAGING_HOST_DIR)/usr/bin/st-flash write $(FW_DIR)/image.bin 0x08000000"

clean:
	@PATH='$(HOST_PATH)' $(MAKE) -C $(BUILD_DIR)/frosted clean
