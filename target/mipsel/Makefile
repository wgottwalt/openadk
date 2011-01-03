# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinux
OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

$(TOOLS_BUILD_DIR):
	@mkdir -p $(TOOLS_BUILD_DIR)

tools-compile: $(TOOLS_BUILD_DIR)
	$(MAKE) -C ../tools/trx
	$(MAKE) -C ../tools/addpattern
	$(MAKE) -C ../tools/srec2bin
	$(MAKE) -C ../tools/squashfs prepare compile install

ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_WRT54G),y)
kernel-install: tools-compile
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(LINUX_DIR)/vmlinux \
		$(LINUX_DIR)/vmlinux.stripped
	@gzip -c9 $(LINUX_DIR)/vmlinux.stripped > $(BUILD_DIR)/$(TARGET_KERNEL)
endif

ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_AG241),y)
kernel-install: tools-compile
	${TARGET_CROSS}objcopy -S -O srec $(KERNEL) $(LINUX_DIR)/vmlinux.srec
	PATH='${TARGET_PATH}' srec2bin $(LINUX_DIR)/vmlinux.srec $(LINUX_DIR)/vmlinux.bin
	(dd if=/dev/zero bs=16 count=1; cat $(LINUX_DIR)/vmlinux.bin) > $(LINUX_DIR)/vmlinux.tmp
	PATH='${TARGET_PATH}' addpattern -p AG3B -b -r 2.0 -i $(LINUX_DIR)/vmlinux.tmp \
		-o $(BUILD_DIR)/$(TARGET_KERNEL) 2>/dev/null
endif

ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB532),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
endif

ifeq ($(ADK_TARGET_FS),cf)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSUSERTARBALL)"
	@echo "Boot the board via network (tftp+nfsroot) and use adkinstall."
	@echo "If you just want to update, use adkupdate."
endif
ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSSQUASHFS)
	@if [ $$(stat -f %z ${BUILD_DIR}/${ROOTFSSQUASHFS}) -gt 3801088 ];then \
		echo 'Image is too big!'; \
	else \
		${CP} ${BUILD_DIR}/${ROOTFSSQUASHFS} ${BIN_DIR}/${ROOTFSSQUASHFS}; \
		echo The image file is $(ROOTFSSQUASHFS); \
		echo 'You can flash the image via tftp:'; \
		echo 'tftp 192.168.1.1'; \
		echo 'tftp> binary'; \
		echo "tftp> put $(ROOTFSSQUASHFS) upgrade_code.bin"; \
	fi
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_AG241),y)
	@echo 'You can flash the kernel via tftp:'
	@echo 'tftp 192.168.1.1'
	@echo 'tftp> binary'
	@echo 'tftp> put $(BIN_DIR)/${TARGET_KERNEL} upgrade_code.bin'
endif
ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_WRT54G),y)
	@echo 'Type following on the CFE prompt to boot the kernel:'
	@echo 'CFE> boot -z -elf -tftp 192.168.1.254:$(BIN_DIR)/${TARGET_KERNEL}'
endif
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Be sure to change permissions after image creation."
	@echo "Start qemu with following options:"
	@echo 'qemu-system-mipsel -nographic -M malta -kernel $(BIN_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-mipsel -nographic -M malta -kernel $(BIN_DIR)/$(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-mipsel -nographic -M malta -kernel $(BIN_DIR)/$(TARGET_KERNEL)'
endif
ifeq ($(ADK_TARGET_FS),yaffs)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is:"
	@echo "$(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Boot the board via network (tftp/nfsroot) and use adkinstall."
	@echo "If you just want to update, use adkupdate."
endif
