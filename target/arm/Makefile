# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel-build.mk
include $(ADK_TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/$(ADK_TARGET_KERNEL)
ifeq ($(ADK_TARGET_KERNEL_ZIMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/zImage
endif
ifeq ($(ADK_TARGET_KERNEL_UIMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/uImage
endif
ifeq ($(ADK_TARGET_KERNEL_XIPIMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/xipImage
endif
ifeq ($(ADK_TARGET_KERNEL_IMAGE),y)
KERNEL:=$(LINUX_DIR)/arch/arm/boot/Image
endif

QEMU_ARGS:=${ADK_QEMU_ARGS}
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_XILINX_ZYNQ),y)
QEMU_ARGS+=-M xilinx-zynq-a9 -dtb $(FW_DIR)/zynq-zc702.dtb -serial null -serial mon:stdio
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_SPITZ),y)
QEMU_ARGS+=-M spitz
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_TERRIER),y)
QEMU_ARGS+=-M terrier
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_REALVIEW_EB_MPCORE),y)
QEMU_ARGS+=-M realview-eb-mpcore -net user -net nic
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VERSATILEPB)$(ADK_TARGET_SYSTEM_QEMU_ARM_VERSATILEPB_NOMMU),y)
ifeq ($(ADK_TARGET_WITH_DEVICETREE),y)
QEMU_ARGS+=-M versatilepb -net user -net nic,model=smc91c111 -dtb $(FW_DIR)/versatile-pb.dtb
else
QEMU_ARGS+=-M versatilepb -net user -net nic,model=smc91c111
endif
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VEXPRESS_A9),y)
QEMU_ARGS+=-M vexpress-a9 -cpu cortex-a9 -m 256 -net user -net nic,model=lan9118 -dtb $(FW_DIR)/vexpress-v2p-ca9.dtb
ifeq ($(ADK_TARGET_ROOTFS_ARCHIVE),y)
QEMU_ARGS+=-drive file=qemu-arm.img,if=sd,format=raw
endif
endif
ifeq ($(ADK_TARGET_QEMU_WITH_VIRTIO),y)
QEMU_ARGS+=-drive file=qemu-${ADK_TARGET_CPU_ARCH}.img,if=virtio,index=0 -net nic,model=virtio -net user
endif

# target helper text
ifeq ($(ADK_TARGET_FS),archive)
targethelp:
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VEXPRESS_A9)$(ADK_TARGET_SYSTEM_QEMU_ARM_VERSATILEPB)$(ADK_TARGET_SYSTEM_QEMU_ARM_TERRIER)$(ADK_TARGET_SYSTEM_QEMU_ARM_SPITZ),y)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh qemu-${ADK_TARGET_CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${ADK_TARGET_CPU_ARCH}.img'
endif
ifeq ($(ADK_TARGET_BOARD_BCM28XX)$(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6)$(ADK_TARGET_SYSTEM_SOLIDRUN_CLEARFOG),y)
ifeq ($(ADK_APPLIANCE_KODI),y)
	@echo "Use following command to install with a writable data partition"
	@echo "sudo ./scripts/install.sh -d 256 $(ADK_TARGET_SYSTEM) /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "If you want to update a card without loosing existing data on the writable partition use:"
	@echo "sudo ./scripts/install.sh -k -d 256 $(ADK_TARGET_SYSTEM) /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "In both cases the cfgfs partition is _not_ removed!"
else
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install.sh $(ADK_TARGET_SYSTEM) /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
endif
endif
ifeq ($(ADK_TARGET_SYSTEM_BANANA_PRO),y)
	@echo "Use following command to install it on SD card:"
	@echo "sudo ./scripts/install.sh banana-pro /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to install with a writable data partition"
	@echo "sudo ./scripts/install.sh -d 256 banana-pro /dev/sdX $(FW_DIR)/$(ROOTFSTARBALL)"
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-arm ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
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
	@echo 'qemu-system-arm ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_LINKSYS_NSLU2),y)
	@echo "Use following in RedBoot bootloader:"
	@echo "RedBoot> ip_address -l <localip> -h <serverip>; load -r -v -b 0x01d00000 ${TARGET_KERNEL}; exec 0x01d00000"
endif
endif
ifeq ($(ADK_TARGET_FS),squashfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS image is: $(FW_DIR)/$(ROOTFSSQUASHFS)"
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-arm $(QEMU_ARGS) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) $(FW_DIR)/$(ROOTFSSQUASHFS)'
endif
endif
ifeq ($(ADK_TARGET_FS),jffs2)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS image is: $(FW_DIR)/$(ROOTFSJFFS2)"
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-arm $(QEMU_ARGS) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) $(FW_DIR)/$(ROOTFSJFFS2)'
endif
endif
ifeq ($(ADK_TARGET_FS),genimage)
targethelp:
	@echo "The disk image is: $(FW_DIR)/disk.img"
	@echo "Use following command to install it on SD card:"
	@echo 'sudo dd if=$(FW_DIR)/disk.img of=/dev/sdX bs=2048k'
endif

kernel-strip:
ifeq ($(ADK_TARGET_KERNEL_VERSION_RPI),y)
	@echo adding DT trailer to kernel $(MAKE_TRACE)
	PATH='$(HOST_PATH)' perl $(LINUX_DIR)/scripts/mkknlimg --dtok $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
else
	@cp $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)
endif

kernel-install: kernel-strip
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
ifeq ($(ADK_TARGET_FS),squashfs)
	env PATH=$(HOST_PATH) qemu-img create -f raw $(FW_DIR)/$(ROOTFSSQUASHFS) $(ADK_TARGET_MTD_SIZE)
	dd conv=notrunc if=$(BUILD_DIR)/root.squashfs of=$(FW_DIR)/$(ROOTFSSQUASHFS)
endif

dtb-install:
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_XILINX_ZYNQ),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		dtbs $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VEXPRESS_A9),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		dtbs $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_ARM_VERSATILEPB)$(ADK_TARGET_SYSTEM_QEMU_ARM_VERSATILEPB_NOMMU),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		dtbs $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_BEAGLEBONE_BLACK),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		am335x-boneblack.dtb
	cp $(LINUX_DIR)/arch/arm/boot/dts/am335x-boneblack.dtb ${TARGET_DIR}/boot
endif
ifeq ($(ADK_TARGET_BOARD_BCM28XX),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		dtbs $(MAKE_TRACE)
	mkdir -p $(FW_DIR)/overlays
	for x in $(LINUX_DIR)/arch/arm/boot/dts/overlays/*.dtb; do \
		[[ -e "$$x" ]] && cp $(LINUX_DIR)/arch/arm/boot/dts/overlays/*.dtb $(FW_DIR)/overlays; \
		break; \
	done
endif
ifeq ($(ADK_TARGET_SYSTEM_BANANA_PRO),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		sun7i-a20-bananapro.dtb $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_IMX6),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		imx6q-cubox-i.dtb imx6dl-cubox-i.dtb imx6dl-hummingboard.dtb imx6q-hummingboard.dtb $(MAKE_TRACE)
endif
ifeq ($(ADK_TARGET_SYSTEM_SOLIDRUN_CLEARFOG),y)
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		armada-388-clearfog.dtb $(MAKE_TRACE)
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
imageinstall: kernel-install dtb-install $(FW_DIR)/$(INITRAMFS) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: kernel-install dtb-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfspiggyback)
imageinstall: dtb-install createinitramfs targethelp
endif
ifeq (${ADK_TARGET_FS},genimage)
imageinstall: dtb-install $(FW_DIR)/$(GENIMAGE) targethelp
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: $(BUILD_DIR)/root.squashfs kernel-install dtb-install targethelp
endif
ifeq ($(ADK_TARGET_FS),jffs2)
imageinstall: kernel-install dtb-install $(FW_DIR)/$(ROOTFSJFFS2) targethelp
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL) targethelp
endif
