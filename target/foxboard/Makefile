# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

$(TOOLS_BUILD_DIR):
	mkdir -p $(TOOLS_BUILD_DIR)

tools-compile: $(TOOLS_BUILD_DIR)
	$(MAKE) -C tools/mkfimage
	$(MAKE) -C tools/e100boot prepare compile install $(MAKE_TRACE)
	$(MAKE) -C tools/squashfs prepare compile install
	$(INSTALL_BIN) tools/boot_linux $(BIN_DIR)/

kernel-install: tools-compile
	PATH='${TARGET_PATH}' mkfimage $(LINUX_DIR)/arch/cris/boot/zImage \
		$(BIN_DIR)/${ADK_TARGET}-${ARCH}-kernel $(MAKE_TRACE)

ifeq ($(FS),squashfs)
imageinstall: $(BIN_DIR)/$(ROOTFSSQUASHFS)
	@echo 
	@echo Use sudo ./boot_linux -F -i $(ROOTFSSQUASHFS) to flash
	@echo Do not forget to set network boot jumper, before you start the foxboard
	@echo 'Login as user root with password linux123 via ssh or console'
endif
ifeq ($(FS),nfsroot)
imageinstall: ${BIN_DIR}/${ROOTFSTARBALL}
	@echo 
	@echo Use sudo ./boot_linux -F -i ${ADK_TARGET}-${ARCH}-kernel to flash the kernel
	@echo Do not forget to set network boot jumper, before you start the foxboard
	@echo ${ROOTFSTARBALL} is your nfs root and can be extracted on your nfs server
	@echo 'Login as user root with password linux123 via ssh or console'
endif
