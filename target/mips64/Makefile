# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinux
OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(TARGET_DIR)/boot/kernel $(BIN_DIR)/$(TARGET_KERNEL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-mips64 -nographic -M malta -kernel $(BIN_DIR)/${TARGET_KERNEL} qemu-${CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(TARGET_DIR)/boot/kernel $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: ${BIN_DIR}/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-mips64 -nographic -M malta -kernel $(BIN_DIR)/${TARGET_KERNEL} -initrd ${BIN_DIR}/${INITRAMFS}'
endif
