# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/microblaze/boot/$(ADK_TARGET_KERNEL)

tools-compile:
	$(MAKE) -C ../tools/mtd-utils all
	$(MAKE) -C ../tools/xz all
	$(MAKE) -C ../tools/squashfs all

ifeq ($(ADK_TARGET_QEMU_MICROBLAZE_MODEL_ML605),y)
MODEL:=petalogix-ml605
DTB:=-dtb target/microblaze/ml605.dtb
endif
ifeq ($(ADK_TARGET_QEMU_MICROBLAZE_MODEL_S3ADSP1800),y)
MODEL:=petalogix-s3adsp1800
DTB:=
endif

ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: tools-compile $(BUILD_DIR)/root.squashfs
	qemu-img create -f raw $(BIN_DIR)/$(ROOTFSSQUASHFS) $(ADK_TARGET_MTD_SIZE)
	dd conv=notrunc if=$(BUILD_DIR)/root.squashfs of=$(BIN_DIR)/$(ROOTFSSQUASHFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} $(DTB) -M $(MODEL) -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) -pflash $(BIN_DIR)/$(ROOTFSSQUASHFS)'
endif
endif
ifeq ($(ADK_TARGET_FS),jffs2)
imageinstall: tools-compile $(BIN_DIR)/$(ROOTFSJFFS2)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} $(DTB) -M $(MODEL) -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) -pflash $(BIN_DIR)/$(ROOTFSJFFS2)'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} $(DTB) -M $(MODEL) -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} $(DTB) -M $(MODEL) -nographic -kernel $(BIN_DIR)/$(TARGET_KERNEL)'
endif
endif
