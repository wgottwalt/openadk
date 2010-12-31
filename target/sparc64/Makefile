# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/sparc64/boot/zImage

ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/${TARGET_KERNEL}
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/${TARGET_KERNEL}
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
endif
