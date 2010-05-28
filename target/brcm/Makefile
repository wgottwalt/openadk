# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

$(TOOLS_BUILD_DIR):
	@mkdir -p $(TOOLS_BUILD_DIR)

tools-compile: $(TOOLS_BUILD_DIR)
	$(MAKE) -C tools/trx

kernel-install: tools-compile
	gzip -c9 $(LINUX_DIR)/vmlinuz > $(LINUX_DIR)/vmlinuz.gz
	PATH='${TARGET_PATH}' trx -o $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel \
		$(LINUX_DIR)/vmlinuz.gz

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
	@echo 'Login as user root with password linux123 via ssh or console.'
endif
