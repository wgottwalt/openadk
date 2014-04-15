# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=${LINUX_DIR}/arch/arm64/boot/Image

kernel-install:
	cd $(TOPDIR) && \
		make -f Makefile \
		-C package/boot-wrapper-aarch64 clean
	cd $(TOPDIR) && \
		make -f Makefile \
		-C package/boot-wrapper-aarch64 package
	${CP} ${LINUX_DIR}/linux-system.axf \
		$(FW_DIR)/$(TARGET_KERNEL)

ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs kernel-install
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_SYSTEM_ARM_FM),y)
	@echo 'Start emulator via:'
	@echo 'Foundation_v8 --image=$(FW_DIR)/${TARGET_KERNEL}'
endif
endif
