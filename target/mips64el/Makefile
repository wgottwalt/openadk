# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinux

ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/${TARGET_KERNEL}
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-mips64el -nographic -M malta -kernel $(BIN_DIR)/${TARGET_KERNEL} -hda qemu-${CPU_ARCH}.img -append "root=/dev/hda1"'
endif
ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/${TARGET_KERNEL}
	@echo 'The kernel file is: ${BIN_DIR}/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-mips64el -nographic -M malta -kernel $(BIN_DIR)/${TARGET_KERNEL} -initrd ${BIN_DIR}/${INITRAMFS}'
endif
