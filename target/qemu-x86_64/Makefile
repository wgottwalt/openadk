# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-x86_64 -nographic -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -kernel $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel qemu-${CPU_ARCH}.img'
endif
ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-x86_64 -nographic -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -kernel $(BIN_DIR)/${ADK_TARGET}-${ARCH}-kernel -initrd ${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel+initramfs file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-x86_64 -nographic -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -kernel $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel'
endif
