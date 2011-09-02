# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

ZKERNEL:=$(LINUX_DIR)/arch/arm/boot/zImage
KERNEL:=$(LINUX_DIR)/vmlinux
LOADADDR:=0x20008000

tools-compile:
	$(MAKE) -C ../tools/uboot-mkimage

kernel-install: tools-compile
	gzip -9 < $(LINUX_DIR)/arch/arm/boot/Image > ${BUILD_DIR}/Image.gz
	PATH='${TARGET_PATH}' mkimage -A arm -O linux -T kernel -C gzip \
		-a ${LOADADDR} -e ${LOADADDR} -d ${BUILD_DIR}/Image.gz \
		-n foxg20 $(KERNEL) $(MAKE_TRACE)

ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install ${BIN_DIR}/${ROOTFSUSERTARBALL}
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'Type dhcp via u-boot prompt to load kernel'
	@echo 'After that type bootm to load the kernel'
endif
ifeq ($(ADK_TARGET_FS),mmc)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is:"
	@echo "$(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo 'Before booting from MicroSD card you need to set following u-boot environment variable:'
	@echo "setenv bootcmd 'mmc init; sleep 1; fatload mmc 0 0x22000000 kernel; bootm 0x22000000'"
	@echo "saveenv"
	@echo
	@echo "Boot the board via network and use adkinstall."
	@echo "If you just want to update, use adkupdate."
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
	@cp $(ZKERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
else
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
endif
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-arm -M spitz -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) -hda qemu-${CPU_ARCH}.img -append "root=/dev/hda1"'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
	@cp $(ZKERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
else
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
endif
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-arm -M spitz -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
	@cp $(ZKERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
else
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
endif
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-arm -M spitz -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL)'
endif
endif
