# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

ifeq ($(ADK_TARGET_KERNEL_ZIMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/zImage
else
KERNEL:=$(LINUX_DIR)/$(ADK_TARGET_KERNEL)
endif

LOADADDR:=0x20008000

ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_SPITZ),y)
MACH:=spitz
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VERSATILEPB),y)
MACH:=versatilepb
NET:=-net user -net nic,model=smc91c111
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VEXPRESS_A9),y)
MACH:=vexpress-a9
NET:=-cpu cortex-a9 -net user -net nic,model=lan9118
endif

kernel-install:
	gzip -9 < $(LINUX_DIR)/arch/arm/boot/Image > ${BUILD_DIR}/Image.gz
	PATH='${TARGET_PATH}' mkimage -A arm -O linux -T kernel -C gzip \
		-a ${LOADADDR} -e ${LOADADDR} -d ${BUILD_DIR}/Image.gz \
		-n foxg20 $(KERNEL) $(MAKE_TRACE)

ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install ${FW_DIR}/${ROOTFSUSERTARBALL}
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'Type dhcp via u-boot prompt to load kernel'
	@echo 'After that type bootm to load the kernel'
endif
ifeq ($(ADK_TARGET_FS),mmc)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is:"
	@echo "$(FW_DIR)/$(ROOTFSTARBALL)"
	@echo 'Before booting from MicroSD card you need to set following u-boot environment variable:'
	@echo "setenv bootcmd 'mmc init; sleep 1; fatload mmc 0 0x22000000 kernel; bootm 0x22000000'"
	@echo "saveenv"
	@echo
	@echo "Boot the board via network and use adkinstall."
	@echo "If you just want to update, use adkupdate."
endif
ifeq ($(ADK_TARGET_FS),archive)
ifeq ($(ADK_TARGET_SYSTEM_ACMESYSTEMS_FOXG20),y)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSTARBALL)
else
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
endif
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install-rpi.sh /dev/sdb $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM)$(ADK_TARGET_SYSTEM_QEMU_ARMHF),y)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh +g qemu-${CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-arm -M $(MACH) -nographic $(NET) -kernel $(FW_DIR)/$(TARGET_KERNEL) -hda qemu-${CPU_ARCH}.img'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(FW_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM)$(ADK_TARGET_SYSTEM_QEMU_ARMHF),y)
ifeq ($(ADK_TARGET_QEMU_WITH_VIRTIO),y)
        @echo 'qemu-system-arm -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) -drive file=qemu-${CPU_ARCH}.img,if=virtio,index=0 -net nic,model=virtio -net user'
else
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-arm -M $(MACH) -nographic $(NET) -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM)$(ADK_TARGET_SYSTEM_QEMU_ARMHF),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-arm -M $(MACH) -nographic $(NET) -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
