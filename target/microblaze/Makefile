# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/microblaze/boot/$(ADK_TARGET_KERNEL)

ifeq ($(ADK_TARGET_QEMU_MICROBLAZE_MODEL_ML605),y)
MODEL:=petalogix-ml605
DTB:=-dtb target/microblaze/ml605.dtb
endif
ifeq ($(ADK_TARGET_QEMU_MICROBLAZE_MODEL_S3ADSP1800),y)
MODEL:=petalogix-s3adsp1800
DTB:=-dtb target/microblaze/s3adsp1800.dtb
endif

ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: $(BUILD_DIR)/root.squashfs
	qemu-img create -f raw $(FW_DIR)/$(ROOTFSSQUASHFS) $(ADK_TARGET_MTD_SIZE)
	dd conv=notrunc if=$(BUILD_DIR)/root.squashfs of=$(FW_DIR)/$(ROOTFSSQUASHFS)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} -M $(MODEL) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) -pflash $(FW_DIR)/$(ROOTFSSQUASHFS) $(DTB)'
endif
endif
ifeq ($(ADK_TARGET_FS),jffs2)
imageinstall: $(FW_DIR)/$(ROOTFSJFFS2)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} -M $(MODEL) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) -pflash $(FW_DIR)/$(ROOTFSJFFS2) $(DTB)'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(FW_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} -M $(MODEL) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS} $(DTB)'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifneq ($(ADK_HARDWARE_QEMU),)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} -M $(MODEL) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) $(DTB)'
endif
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif
