# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

$(TOOLS_BUILD_DIR):
	mkdir -p $(TOOLS_BUILD_DIR)

tools-compile: $(TOOLS_BUILD_DIR)
	$(MAKE) -C tools/mkfimage

kernel-install: tools-compile
	PATH='${TARGET_PATH}' \
	mkfimage $(LINUX_DIR)/arch/cris/arch-v32/boot/zImage \
		$(BIN_DIR)/${ADK_TARGET}-${ARCH}-kernel $(MAKE_TRACE)

ifeq ($(FS),ext2)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh qemu.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo 'Login as user root with password linux123 via ssh or console'
endif

ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${ARCH}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
