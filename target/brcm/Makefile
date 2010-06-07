# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

$(TOOLS_BUILD_DIR):
	@mkdir -p $(TOOLS_BUILD_DIR)

tools-compile: $(TOOLS_BUILD_DIR)
	$(MAKE) -C tools/trx

kernel-install: tools-compile
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(LINUX_DIR)/vmlinux \
		$(LINUX_DIR)/vmlinuz
	@gzip -c9 $(LINUX_DIR)/vmlinuz > \
		$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
	@echo 'Type following on the CFE prompt to boot the kernel:'
	@echo 'CFE> boot -z -elf -tftp 192.168.1.254:${ADK_TARGET}-${FS}-kernel'
	@echo 'Login as user root with password linux123 via ssh or console.'
endif
