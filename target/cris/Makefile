# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

ZKERNEL:=$(LINUX_DIR)/arch/cris/boot/zImage
KERNEL:=$(LINUX_DIR)/vmlinux

tools-compile:
	$(MAKE) -C ../tools/mkfimage all
ifneq ($(ADK_HOST_DARWIN),y)
	$(MAKE) -C ../tools/e100boot all
endif
	$(MAKE) -C ../tools/squashfs all
	$(INSTALL_BIN) ../tools/boot_linux $(BIN_DIR)/

kernel-install: tools-compile
	PATH='${TARGET_PATH}' mkfimage $(ZKERNEL) $(BUILD_DIR)/$(TARGET_KERNEL) $(MAKE_TRACE)

${BUILD_DIR}/${ROOTFSSQUASHFS}: ${BUILD_DIR}/root.squashfs
	cat ${BUILD_DIR}/${TARGET_KERNEL} ${BUILD_DIR}/root.squashfs \
		>${BUILD_DIR}/${ROOTFSSQUASHFS}

ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: kernel-install $(BUILD_DIR)/$(ROOTFSSQUASHFS)
	dd if=${BUILD_DIR}/${ROOTFSSQUASHFS} of=${BIN_DIR}/${ROOTFSSQUASHFS} \
		bs=4063232 conv=sync $(MAKE_TRACE)
	@if [ $$($(STATCMD) ${BIN_DIR}/${ROOTFSSQUASHFS}) -gt 4063232 ];then \
		echo 'Image is too big!'; \
	else \
		echo 'Use sudo ./boot_linux -F -i $(ROOTFSSQUASHFS) to flash'; \
		echo 'Do not forget to set the network boot jumper, before you start the foxboard'; \
	fi
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install ${BIN_DIR}/${ROOTFSUSERTARBALL}
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo Use sudo ./boot_linux -F -i $(BIN_DIR)/${TARGET_KERNEL} to flash the kernel
	@echo Do not forget to set network boot jumper, before you start the foxboard
	@echo ${ROOTFSUSERTARBALL} is your nfs root and can be extracted on your nfs server
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_SYSTEM_QEMU_CRIS),y)
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f ${ADK_TARGET_ROOTFS} qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -M axis-dev88 -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_CRIS),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -M axis-dev88 -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/${TARGET_KERNEL}
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_CRIS),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-cris -M axis-dev88 -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL)'
endif
endif
