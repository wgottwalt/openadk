# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	cp $(LINUX_DIR)/vmlinux $(BIN_DIR)/${DEVICE}-${ARCH}-kernel

ifeq ($(FS),ext2)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -n qemu-mips.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-mipsel -nographic -M malta -kernel $(BIN_DIR)/${DEVICE}-${ARCH}-kernel -hda qemu-mips.img -append="root=/dev/hda1 init=/init"'
endif

ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-mipsel -nographic -M malta -kernel $(BIN_DIR)/${DEVICE}-${ARCH}-kernel -initrd ${BIN_DIR}/${INITRAMFS} -append "init=/init"'
endif
