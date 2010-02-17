# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

kernel-install: 
	gzip -v9 < $(LINUX_DIR)/arch/arm/boot/Image > ${BUILD_DIR}/Image.gz
	mkimage -A arm -O linux -T kernel -C gzip \
		-a 0x20008000 -e 0x20008000 -d ${BUILD_DIR}/Image.gz \
		-n foxg20 $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel

ifeq ($(FS),nfsroot)
imageinstall: ${BIN_DIR}/${ROOTFSUSERTARBALL}
	@echo 
	@echo 'Type dhcp via u-boot prompt to load kernel'
	@echo 'After that type bootm to load the kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
