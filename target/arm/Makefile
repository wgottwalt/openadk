# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel.mk
include $(ADK_TOPDIR)/mk/modules.mk
include $(ADK_TOPDIR)/mk/kernel-build.mk
include $(ADK_TOPDIR)/mk/image.mk

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
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_TERRIER),y)
QEMU_ARGS+=-M terrier
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VERSATILEPB),y)
QEMU_ARGS+=-M versatilepb -net user -net nic,model=smc91c111
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VEXPRESS_A9),y)
QEMU_ARGS+=-M vexpress-a9 -cpu cortex-a9 -net user -net nic,model=lan9118
endif
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_STELLARIS_M3),y)
QEMU_ARGS+=-M lm3s6965evb -cpu cortex-m3
endif
ifeq ($(ADK_TARGET_QEMU_WITH_VIRTIO),y)
QEMU_ARGS+=-drive file=qemu-${ADK_TARGET_CPU_ARCH}.img,if=virtio,index=0 -net nic,model=virtio -net user
endif

# target helper text
ifeq ($(ADK_TARGET_FS),archive)
targethelp:
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_QEMU_ARM_MODEL_VERSATILEPB)$(ADK_TARGET_QEMU_ARM_MODEL_TERRIER)$(ADK_TARGET_QEMU_ARM_MODEL_SPITZ),y)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh qemu-${ADK_TARGET_CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${ADK_TARGET_CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install.sh raspberry-pi /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to install with a writable data partition"
	@echo "sudo ./scripts/install.sh -d 256 raspberry-pi /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI2),y)
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install.sh raspberry-pi2 /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to install with a writable data partition"
	@echo "sudo ./scripts/install.sh -d 256 raspberry-pi2 /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
ifeq ($(ADK_APPLIANCE_KODI),y)
	@echo "Use following command to install with a writable data partition"
	@echo "sudo ./scripts/install.sh -d 256 solidrun-imx6 /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "If you want to update a card without loosing existing data on the writable partition use:"
	@echo "sudo ./scripts/install.sh -k -d 256 solidrun-imx6 /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "In both cases the cfgfs partition is _not_ removed!"
else
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install.sh solidrun-imx6 /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
endif
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfspiggyback)
targethelp:
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif

kernel-strip:
	@cp $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
ifeq ($(ADK_KERNEL_BCM2708_DT),y)
	@echo adding DT trailer to kernel $(MAKE_TRACE)
	-rm $(BUILD_DIR)/$(TARGET_KERNEL)
	$(ADK_TOPDIR)/scripts/mkknlimg --dtok $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL) $(MAKE_TRACE)
endif
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI2),y)
ifeq ($(ADK_KERNEL_BCM2709_DT),y)
	@echo adding DT trailer to kernel $(MAKE_TRACE)
	-rm $(BUILD_DIR)/$(TARGET_KERNEL)
	$(ADK_TOPDIR)/scripts/mkknlimg --dtok $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL) $(MAKE_TRACE)
endif
endif

kernel-install: kernel-strip
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(FW_DIR)/$(TARGET_KERNEL)

dtb-install:
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) $(KERNEL_MAKE_OPTS) dtbs $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_RASPBERRY_PI2),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) $(KERNEL_MAKE_OPTS) dtbs $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) $(KERNEL_MAKE_OPTS) \
		imx6q-cubox-i.dtb imx6dl-cubox-i.dtb imx6dl-hummingboard.dtb imx6q-hummingboard.dtb $(MAKE_TRACE)
endif
	for x in $(LINUX_DIR)/arch/arm/boot/dts/*.dtb; do \
		[[ -e "$$x" ]] && cp $(LINUX_DIR)/arch/arm/boot/dts/*.dtb $(FW_DIR); \
		break; \
	done

# filesystem specific targets
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: dtb-install $(FW_DIR)/$(ROOTFSTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: kernel-install $(FW_DIR)/$(INITRAMFS) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfspiggyback)
imageinstall: createinitramfs targethelp
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL) targethelp
endif
