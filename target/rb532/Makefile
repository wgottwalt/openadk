# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(LINUX_DIR)/vmlinux \
		$(TARGET_DIR)/boot/kernel 
	@cp $(TARGET_DIR)/boot/kernel \
		$(BUILD_DIR)/${ADK_TARGET}-${FS}-kernel

ifeq ($(FS),ext2-block)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(BUILD_DIR)/${ADK_TARGET}-${FS}-kernel \
		$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSUSERTARBALL)"
	@echo "Boot the board via network (tftp/nfsroot) and use adkinstall."
	@echo "If you just want to update, use adkupdate."
	@echo 'Login as user root with password linux123 via ssh or console.'
endif

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(BUILD_DIR)/${ADK_TARGET}-${FS}-kernel \
		$(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
	@echo 'Login as user root with password linux123 via ssh or console.'
endif

ifeq ($(FS),yaffs)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 
	@echo "The RootFS tarball is:"
	@echo "$(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Boot the board via network (tftp/nfsroot) and use adkinstall."
	@echo "If you just want to update, use adkupdate."
	@echo 'Login as user root with password linux123 via ssh or console.'
endif
