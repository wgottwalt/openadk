# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	cp $(LINUX_DIR)/vmlinux $(BIN_DIR)/${DEVICE}-${ARCH}-kernel

ifeq ($(FS),ext2-cf)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
endif

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
endif
