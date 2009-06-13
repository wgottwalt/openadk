# $Id: Makefile 30 2008-09-04 13:31:09Z wbx $
#-
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
	$(MAKE) -C tools/squashfs prepare compile install

kernel-install: tools-compile
	PATH='${TARGET_PATH}' \
	mipsel-linux-objcopy -S -O srec $(LINUX_DIR)/vmlinux \
		$(LINUX_DIR)/vmlinux.srec
	PATH='${TARGET_PATH}' \
	srec2bin $(LINUX_DIR)/vmlinux.srec $(LINUX_DIR)/vmlinux.bin
	(dd if=/dev/zero bs=16 count=1; cat $(LINUX_DIR)/vmlinux.bin) > \
		$(LINUX_DIR)/vmlinux.tmp
	PATH='${TARGET_PATH}' \
	addpattern -p WA21 -i $(LINUX_DIR)/vmlinux.tmp \
		-o $(BIN_DIR)/${DEVICE}-${ARCH}-kernel	

ifeq ($(FS),squashfs)
imageinstall: $(BIN_DIR)/$(ROOTFSSQUASHFS)
	${CP} ${BUILD_DIR}/${ROOTFSSQUASHFS} $(BIN_DIR)/$(ROOTFSSQUASHFS)
	@echo
	@echo The image file is $(ROOTFSSQUASHFS)
	@echo 'You can flash the image via tftp:'
	@echo 'tftp 192.168.1.1'
	@echo 'tftp> binary'
	@echo "tftp> put $(ROOTFSSQUASHFS) upgrade_code.bin"

endif

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo
	@echo 'The kernel file is: ${BIN_DIR}/${DEVICE}-${ARCH}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'You can flash the kernel via tftp:'
	@echo 'tftp 192.168.1.1'
	@echo 'tftp> binary'
	@echo 'tftp> put wag54g-mips-kernel upgrade_code.bin'

endif
