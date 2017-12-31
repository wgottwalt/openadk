# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

prepare:
	if [ ! -d $(BUILD_DIR)/zephyr ]; then \
		cd $(BUILD_DIR) ;\
		git clone https://github.com/zephyrproject-rtos/zephyr.git ;\
	fi
	if [ ! -d $(BUILD_DIR)/zephyr-kconfig ]; then \
		mkdir $(BUILD_DIR)/zephyr-kconfig ;\
	fi
	cd $(BUILD_DIR)/zephyr-kconfig && \
		PATH='$(HOST_PATH)' cmake $(BUILD_DIR)/zephyr/scripts && \
		make
	source $(BUILD_DIR)/zephyr/zephyr-env.sh

compile:
	export GCCXTENSA_TOOLCHAIN_PATH="$(TOOLCHAIN_DIR)"
	export ZEPHYR_GCC_VARIANT=gccxtensa
	if [ ! -d $(BUILD_DIR)/zephyr/samples/hello_world/build ]; then \
		mkdir $(BUILD_DIR)/zephyr/samples/hello_world/build ;\
	fi
	cd $(BUILD_DIR)/zephyr/samples/hello_world/build && \
		cmake -DBOARD=qemu_xtensa .. && \
		make

install:

targethelp:

clean:
