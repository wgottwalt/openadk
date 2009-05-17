# $Id: Makefile 30 2008-09-04 13:31:09Z wbx $
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	cp $(LINUX_DIR)/vmlinux $(BIN_DIR)/${DEVICE}-${ARCH}-kernel

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
endif
ifeq ($(FS),yaffs)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Format your NAND with Routerboot, boot via NFS and'
	@echo 'then install kernel and filesystem:'
	@echo 'mount -t yaffs2 /dev/mtdblock0 /mnt'
	@echo 'cp ${DEVICE}-${ARCH}-kernel /mnt/kernel'
endif
