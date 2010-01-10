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
	$(MAKE) -C tools/addpattern
	$(MAKE) -C tools/srec2bin
	$(MAKE) -C ../tools/squashfs prepare compile install

kernel-install: tools-compile
	PATH='${TARGET_PATH}' \
	mipsel-linux-objcopy -S -O srec $(LINUX_DIR)/vmlinux \
		$(LINUX_DIR)/vmlinux.srec
	PATH='${TARGET_PATH}' \
	srec2bin $(LINUX_DIR)/vmlinux.srec $(LINUX_DIR)/vmlinux.bin
	(dd if=/dev/zero bs=16 count=1; cat $(LINUX_DIR)/vmlinux.bin) > \
		$(LINUX_DIR)/vmlinux.tmp
	PATH='${TARGET_PATH}' \
	addpattern -p AG3B -b -r 2.0 -i $(LINUX_DIR)/vmlinux.tmp \
		-o $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel	

ifeq ($(FS),squashfs)
imageinstall: $(BIN_DIR)/$(ROOTFSSQUASHFS)
	@if [ $$(stat --format=%s ${BUILD_DIR}/${ROOTFSSQUASHFS}) -gt 3801088 ];then \
		echo 'Image is too big!'; \
	else \
		${CP} ${BUILD_DIR}/${ROOTFSSQUASHFS} ${BIN_DIR}/${ROOTFSSQUASHFS}; \
		echo The image file is $(ROOTFSSQUASHFS); \
		echo 'You can flash the image via tftp:'; \
		echo 'tftp 192.168.1.1'; \
		echo 'tftp> binary'; \
		echo "tftp> put $(ROOTFSSQUASHFS) upgrade_code.bin"; \
		echo 'Login as user root with password linux123 via ssh or console'; \
	fi
endif

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'You can flash the kernel via tftp:'
	@echo 'tftp 192.168.1.1'
	@echo 'tftp> binary'
	@echo 'tftp> put ${ADK_TARGET}-${FS}-kernel upgrade_code.bin'
	@echo 'Login as user root with password linux123 via ssh or console'
endif
