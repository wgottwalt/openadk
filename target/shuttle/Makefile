# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install:

createinit:
	@-rm $(LINUX_DIR)/usr/initramfs_data.cpio.lzma
	$(SED) 's#^CONFIG_INITRAMFS_SOURCE.*#CONFIG_INITRAMFS_SOURCE="${BUILD_DIR}/${INITRAMFS_PIGGYBACK}"#' $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_ROOT_UID=0' >> $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_ROOT_GID=0' >> $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_COMPRESSION_LZMA=y' >> $(LINUX_DIR)/.config
	echo N |$(MAKE) -C $(LINUX_DIR) V=0 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" oldconfig $(MAKE_TRACE) 
	$(MAKE) -C $(LINUX_DIR) V=0 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" $(MAKE_TRACE)
	$(CP) $(LINUX_DIR)/arch/x86/boot/bzImage \
		$(BIN_DIR)/${DEVICE}-${ARCH}-kernel

ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	cp $(LINUX_DIR)/arch/x86/boot/bzImage $(BIN_DIR)/${DEVICE}-${ARCH}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Login as user root with password linux123 via ssh or console'
endif

ifeq ($(FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinit
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
