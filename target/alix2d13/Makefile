# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

kernel-install:
	@cp $(KERNEL) $(TARGET_DIR)/boot/vmlinuz-adk

ifeq ($(FS),ext2-block)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to CompactFlash use scripts/install.sh"
	@echo 'Login as user root with password linux123 via ssh or console'
endif
ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo
	@echo 'The linux kernel is here: $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is here: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
