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

createinit:
	@-rm $(LINUX_DIR)/usr/initramfs_data.cpio.* $(MAKE_TRACE)
	$(SED) 's#^CONFIG_INITRAMFS_SOURCE.*#CONFIG_INITRAMFS_SOURCE="${BUILD_DIR}/${INITRAMFS_PIGGYBACK}"#' $(LINUX_DIR)/.config
	echo N |$(MAKE) -C $(LINUX_DIR) V=0 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" oldconfig $(MAKE_TRACE) 
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" $(MAKE_TRACE)
	$(CP) $(LINUX_DIR)/arch/cris/boot/zImage \
		$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel

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
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinit
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -nographic -kernel $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
