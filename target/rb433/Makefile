# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	cp $(LINUX_DIR)/vmlinux $(BIN_DIR)/${ADK_TARGET}-${ARCH}-kernel

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${ARCH}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
ifeq ($(FS),yaffs)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${ARCH}-kernel'
	@echo 'The root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Format your NAND with Routerboot, boot via NFS and'
	@echo 'then install kernel and filesystem:'
	@echo 'mount -t yaffs2 /dev/mtdblock0 /mnt'
	@echo 'cp ${ADK_TARGET}-${ARCH}-kernel /mnt/kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
