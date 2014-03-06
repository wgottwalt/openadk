# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/$(ADK_TARGET_KERNEL)

OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

ifeq ($(ADK_TARGET_SYSTEM_BROADCOM_BCM47XX),y)
kernel-install:
	${TARGET_CROSS}objcopy ${OSTRIP} -S ${LINUX_DIR}/vmlinuz.elf \
	    ${BUILD_DIR}/${TARGET_KERNEL}

${BUILD_DIR}/${ROOTFSSQUASHFS}: ${BUILD_DIR}/root.squashfs
	${TARGET_CROSS}objcopy -O binary ${BUILD_DIR}/${TARGET_KERNEL} \
		${BUILD_DIR}/${TARGET_KERNEL}.bin
	gzip -n9 <${BUILD_DIR}/${TARGET_KERNEL}.bin \
		>${BUILD_DIR}/${TARGET_KERNEL}.bin.gz
	printf '\0' >>${BUILD_DIR}/${TARGET_KERNEL}.bin.gz
	PATH='${TARGET_PATH}' trx -o $@~ -f ${BUILD_DIR}/${TARGET_KERNEL}.bin.gz -a 1024 -f ${BUILD_DIR}/root.squashfs
ifneq ($(ADK_TARGET_BROADCOM_MODEL_ASUS_WL500GP),y)
	PATH='${TARGET_PATH}' addpattern -4 ${ADK_TOOLS_ADDPATTERN_ARGS} -g -i $@~ -o $@
else
	cp $@~ $@
endif
endif

ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_AG241),y)
kernel-install:
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
ifeq ($(ADK_TARGET_SYSTEM_MIKROTIK_RB4XX),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
endif
ifeq ($(ADK_TARGET_SYSTEM_FON_FON2100),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)

${BUILD_DIR}/${ROOTFSSQUASHFS}: ${BUILD_DIR}/root.squashfs
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(LINUX_DIR)/vmlinux $(BUILD_DIR)/vmlinux.strip
	dd if=$(BUILD_DIR)/vmlinux.strip of=${BUILD_DIR}/vmlinux bs=65536 conv=sync
	lzma -9efzc ${BUILD_DIR}/vmlinux > $(FW_DIR)/${TARGET_KERNEL}
	cp ${BUILD_DIR}/root.squashfs ${BUILD_DIR}/${ROOTFSSQUASHFS}
endif
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPS),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_MIPSEL),y)
kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
endif

ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(FW_DIR)/${TARGET_KERNEL}
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The nfs root tarball is: ${FW_DIR}/${ROOTFSUSERTARBALL}'
ifeq ($(ADK_TARGET_SYSTEM_FON_FON2100),y)
	@echo 'Type the following in Redboot:'
	@echo 'RedBoot> load $(TARGET_KERNEL)'
	@echo 'RedBoot> go'
endif
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
	@echo 'Boot your lemote and type following commands in PMON:'
	@echo 'PMON> ifaddr rtl0 <ip-address-client>'
	@echo 'PMON> load tftp://<ip-address-server>/${TARGET_KERNEL}'
	@echo 'PMON> g'
endif
endif
ifeq ($(ADK_TARGET_FS),yaffs)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSTARBALL)
	@echo 'The root tarball is: ${FW_DIR}/${ROOTFSTARBALL}'
	@echo 'Format your NAND with Routerboot, boot via NFS and'
	@echo 'then install kernel and filesystem via:'
	@echo 'adkinstall ${ROOTFSTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifneq ($(ADK_HARDWARE_QEMU),)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh +g qemu-${CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} -nographic -M malta -device e1000,netdev=adk0 -netdev user,id=adk0 -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
	@echo "Startup the netbook and type del to enter PMON:"
	@echo "PMON> load /dev/fs/ext2@wd0a/boot/kernel"
	@echo "PMON> g root=/dev/sda1"
	@echo "The root parameter have to be changed."
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(FW_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} -nographic -M malta -device e1000,netdev=adk0 -netdev user,id=adk0 -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} -nographic -M malta -device e1000,netdev=adk0 -netdev user,id=adk0 -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
	@echo "Startup the netbook and type del to enter PMON:"
	@echo "PMON> load /dev/fs/ext2@usb0/boot/kernel"
	@echo "PMON> g root=/dev/sdc1"
endif
endif
ifeq ($(ADK_TARGET_FS),cf)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
	@echo "Boot the board via network (tftp+nfsroot) and use adkinstall."
	@echo "If you just want to update, use adkupdate."
endif
ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: kernel-install ${BUILD_DIR}/${ROOTFSSQUASHFS}
	@if [ $$($(STATCMD) ${BUILD_DIR}/${ROOTFSSQUASHFS}) -gt 3801088 ];then \
		echo 'Image is too big!'; \
	else \
		${CP} ${BUILD_DIR}/${ROOTFSSQUASHFS} ${FW_DIR}/${ROOTFSSQUASHFS}; \
		echo The image file is $(ROOTFSSQUASHFS); \
	fi
ifeq ($(ADK_TARGET_SYSTEM_FON_FON2100),y)
	@echo The kernel file is $(TARGET_KERNEL)
endif
ifeq ($(ADK_TARGET_SYSTEM_BROADCOM_BCM47XX),y)
	@echo 'You can flash the image via tftp:'
	@echo 'tftp 192.168.1.1'
	@echo 'tftp> binary'
	@echo "tftp> put $(ROOTFSSQUASHFS) upgrade_code.bin"
endif
endif
