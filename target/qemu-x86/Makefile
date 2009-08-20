# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	cp $(LINUX_DIR)/arch/x86/boot/bzImage $(TARGET_DIR)/boot/kernel

ifeq ($(FS),ext2)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh qemu.img $(BIN_DIR)/$(ROOTFSTARBALL)"
endif

ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(LINUX_DIR)/arch/x86/boot/bzImage $(BIN_DIR)/${DEVICE}-${ARCH}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu -nographic -kernel $(BIN_DIR)/${DEVICE}-${ARCH}-kernel -initrd ${BIN_DIR}/${INITRAMFS} -append "init=/init console=ttyS0"'
endif
