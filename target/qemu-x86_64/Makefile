# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	cp $(LINUX_DIR)/arch/x86/boot/bzImage $(TARGET_DIR)/boot/kernel

ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh qemu.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo 'Login as user root with password linux123 via ssh or console'
endif

ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(LINUX_DIR)/arch/x86/boot/bzImage $(BIN_DIR)/${ADK_TARGET}-${ARCH}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${ARCH}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-x86_64 -nographic -kernel $(BIN_DIR)/${ADK_TARGET}-${ARCH}-kernel -initrd ${BIN_DIR}/${INITRAMFS} -append "console=ttyS0"'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
