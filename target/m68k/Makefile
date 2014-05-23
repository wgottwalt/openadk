# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinux.gz

# target helper text
ifeq ($(ADK_TARGET_FS),initramfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_SYSTEM_ARANYM_M68K),y)
	@sed -e "s#@@KERNEL@@#$(FW_DIR)/$(TARGET_KERNEL)#" \
	    -e "s#@@INITRAMFS@@#${FW_DIR}/${INITRAMFS}#" \
		$(TOPDIR)/target/m68k/aranym.cfg.in \
		> $(TOPDIR)/target/m68k/aranym.cfg
	@echo 'Start aranym with: aranym-mmu -l -c target/m68k/aranym.cfg'
	@echo 'Ungrab mouse with middle mouse click'
endif
endif

kernel-strip:

kernel-install: kernel-strip
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)

# filesystem specific targets
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: kernel-install $(FW_DIR)/$(INITRAMFS) targethelp
endif
