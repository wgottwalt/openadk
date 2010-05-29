# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:
	@cp $(LINUX_DIR)/arch/cris/boot/zImage \
		$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel $(MAKE_TRACE)

ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@echo
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSUSERTARBALL),"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSUSERTARBALL)"
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -nographic -kernel $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel qemu-${CPU_ARCH}.img'
	@echo 'Login as user root with password linux123 via ssh or console'
endif

ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -nographic -kernel $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif

ifeq ($(FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -nographic -kernel $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
