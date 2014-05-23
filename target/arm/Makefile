# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/$(ADK_TARGET_KERNEL)
ifeq ($(ADK_TARGET_KERNEL_ZIMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/zImage
endif
ifeq ($(ADK_TARGET_KERNEL_UIMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/uImage
endif

QEMU_ARGS:=${ADK_QEMU_ARGS}
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_SPITZ),y)
QEMU_ARGS+=-M spitz
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VERSATILEPB),y)
QEMU_ARGS+=-M versatilepb -net user -net nic,model=smc91c111
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VEXPRESS_A9),y)
QEMU_ARGS+=vexpress-a9 -cpu cortex-a9 -net user -net nic,model=lan9118
endif
ifeq ($(ADK_TARGET_QEMU_WITH_VIRTIO),y)
QEMU_ARGS+=-drive file=qemu-${CPU_ARCH}.img,if=virtio,index=0 -net nic,model=virtio -net user
endif

# target helper text
ifeq ($(ADK_TARGET_FS),archive)
targethelp:
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh qemu-${CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install-rpi.sh /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_SYSTEM_CUBOX_I),y)
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install-cubox.sh /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL) $(FW_DIR)"

endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-archive)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
targethelp:
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif

kernel-strip:

kernel-install:
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)

dtb-install:
	env $(KERNEL_MAKE_ENV) $(MAKE) -C $(LINUX_DIR) $(KERNEL_MAKE_OPTS) \
		-j${ADK_MAKE_JOBS} imx6q-cubox-i.dtb imx6dl-cubox-i.dtb $(MAKE_TRACE)
	$(CP) $(LINUX_DIR)/arch/arm/boot/dts/imx6*-cubox-i.dtb \
		$(FW_DIR)


# filesystem specific targets
ifeq ($(ADK_TARGET_FS),archive)
ifeq ($(ADK_TARGET_SYSTEM_CUBOX_I),y)
imageinstall: dtb-install $(FW_DIR)/$(ROOTFSTARBALL) targethelp
else
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL) targethelp
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: kernel-install $(FW_DIR)/$(INITRAMFS) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfs-archive)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs targethelp
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL) targethelp
endif
