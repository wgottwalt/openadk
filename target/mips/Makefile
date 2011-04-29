# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
KERNEL:=$(LINUX_DIR)/vmlinuz
else
KERNEL:=$(LINUX_DIR)/vmlinux
endif

OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

tools-compile:
	$(MAKE) -C ../tools/trx all
	$(MAKE) -C ../tools/addpattern all
	$(MAKE) -C ../tools/srec2bin all
	$(MAKE) -C ../tools/squashfs all

ifeq ($(ADK_TARGET_SYSTEM_BROADCOM_BCM47XX),y)
kernel-install: tools-compile
	${TARGET_CROSS}objcopy ${OSTRIP} -S ${LINUX_DIR}/vmlinuz.elf \
	    ${BUILD_DIR}/${TARGET_KERNEL}

${BUILD_DIR}/${ROOTFSSQUASHFS}: ${BUILD_DIR}/root.squashfs
	${TARGET_CROSS}objcopy -O binary ${BUILD_DIR}/${TARGET_KERNEL} \
	    ${BUILD_DIR}/${TARGET_KERNEL}.bin
	gzip -n9 <${BUILD_DIR}/${TARGET_KERNEL}.bin \
	    >${BUILD_DIR}/${TARGET_KERNEL}.bin.gz
	printf '\0' >>${BUILD_DIR}/${TARGET_KERNEL}.bin.gz
	PATH='${TARGET_PATH}' trx -o $@~ -f ${BUILD_DIR}/${TARGET_KERNEL}.bin.gz -a 1024 -f ${BUILD_DIR}/root.squashfs
	PATH='${TARGET_PATH}' addpattern -4 ${ADK_TOOLS_ADDPATTERN_ARGS} -g -i $@~ -o $@
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
ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB411),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(TARGET_DIR)/boot/kernel
endif
ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB433),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(TARGET_DIR)/boot/kernel
endif

ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(TARGET_DIR)/boot/kernel $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),yaffs)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 'The root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Format your NAND with Routerboot, boot via NFS and'
	@echo 'then install kernel and filesystem via:'
	@echo 'adkinstall ${ROOTFSTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(TARGET_DIR)/boot/kernel $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-mips -nographic -M malta -kernel $(BIN_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-mips -nographic -M malta -kernel $(BIN_DIR)/$(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-mips -nographic -M malta -kernel $(BIN_DIR)/$(TARGET_KERNEL)'
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
	@echo "Startup the netbook and type del to enter PMON:"
	@echo "PMON> load /dev/fs/ext2@usb0/boot/kernel"
	@echo "PMON> g console=tty no_auto_cmd"
endif
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
imageinstall: kernel-install ${BUILD_DIR}/${ROOTFSSQUASHFS}
	@if [ $$($(STATCMD) ${BUILD_DIR}/${ROOTFSSQUASHFS}) -gt 3801088 ];then \
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

