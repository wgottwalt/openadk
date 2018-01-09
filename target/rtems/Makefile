# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

prepare:
	if [ ! -d $(BUILD_DIR)/rtems ]; then \
		cd $(BUILD_DIR) ;\
		git clone git://git.rtems.org/rtems.git ;\
	fi
	if [ ! -f $(BUILD_DIR)/rtems/configure ]; then \
		cd $(BUILD_DIR)/rtems && ./bootstrap ;\
	fi
	-mkdir $(BUILD_DIR)/rtems-build
	cd $(BUILD_DIR)/rtems-build && \
		PATH='$(TARGET_PATH)' $(BUILD_DIR)/rtems/configure \
		--prefix=$(BUILD_DIR)/rtems-install
		--target=$(ADK_TARGET_CPU_ARCH)-$(ADK_TARGET_OS) \
		--enable-tests=samples \

compile:
	PATH='$(TARGET_PATH)' $(MAKE) -C \
	     $(BUILD_DIR)/rtems-build

install:
	-mkdir $(BUILD_DIR)/rtems-install
	PATH='$(TARGET_PATH)' $(MAKE) -C \
	     $(BUILD_DIR)/rtems-build install

clean:

targethelp:

