# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

LOADADDR:=	0x20008000

kernel-install: 
	gzip -9 < $(LINUX_DIR)/arch/arm/boot/Image > ${BUILD_DIR}/Image.gz
	mkimage -A arm -O linux -T kernel -C gzip \
		-a ${LOADADDR} -e ${LOADADDR} -d ${BUILD_DIR}/Image.gz \
		-n foxg20 $(TARGET_DIR)/boot/uImage $(MAKE_TRACE)
	@cp $(TARGET_DIR)/boot/uImage \
		$(BUILD_DIR)/${ADK_TARGET}-${FS}-kernel

ifeq ($(FS),nfsroot)
imageinstall: ${BIN_DIR}/${ROOTFSUSERTARBALL}
	@cp $(BUILD_DIR)/${ADK_TARGET}-${FS}-kernel \
		$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 
	@echo 'Type dhcp via u-boot prompt to load kernel'
	@echo 'After that type bootm to load the kernel'
	@echo 'Login as user root with password linux123 via ssh or console'
endif

ifeq ($(FS),ext2-block)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo "The RootFS tarball is:"
	@echo "$(BIN_DIR)/$(ROOTFSUSERTARBALL)"
	@echo 'Before booting from MicroSD card you need to set following u-boot environment variables:'
	@echo "setenv bootcmd 'mmc init; sleep 1; fatload mmc 0 0x22000000 uimage; bootm 0x22000000'"
	@echo
	@echo "Boot the board via network and use adkinstall."
	@echo "If you just want to update, use adkupdate."
	@echo 'Login as user root with password linux123 via ssh or console.'
endif
