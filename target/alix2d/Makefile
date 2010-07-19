# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

ifeq ($(FS),ext2-block)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is:"
	@echo "$(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to CompactFlash use scripts/install.sh"
endif
ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 'The linux kernel is here:'
	@echo '$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is here:'
	@echo '${BIN_DIR}/${ROOTFSUSERTARBALL}'
endif
ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel file is:'
	@echo '${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The initramfs image is:'
	@echo '${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel+initramfs file is:'
	@echo '${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
endif
