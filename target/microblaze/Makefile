# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/microblaze/boot/$(ADK_TARGET_KERNEL)

QEMU_ARGS:=${ADK_QEMU_ARGS}
ifeq ($(ADK_TARGET_QEMU_MICROBLAZE_MODEL_ML605),y)
QEMU_ARGS+=-M petalogix-ml605 -dtb target/microblaze/ml605.dtb
endif
ifeq ($(ADK_TARGET_QEMU_MICROBLAZE_MODEL_S3ADSP1800),y)
QEMU_ARGS+=-M petalogix-s3adsp1800
endif

# target helper text
ifeq ($(ADK_TARGET_FS),initramfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_QEMU),y)
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
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq ($(ADK_TARGET_FS),squashfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS image is: $(FW_DIR)/$(ROOTFSSQUASHFS)"
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} $(QEMU_ARGS) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) -pflash $(FW_DIR)/$(ROOTFSSQUASHFS)'
endif
endif
ifeq ($(ADK_TARGET_FS),jffs2)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS image is: $(FW_DIR)/$(ROOTFSSQUASHFS)"
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${CPU_ARCH} $(QEMU_ARGS) -nographic -kernel $(FW_DIR)/$(TARGET_KERNEL) -pflash $(FW_DIR)/$(ROOTFSSQUASHFS)'
endif
endif

kernel-strip:
	@cp $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)

kernel-install: kernel-strip
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
ifeq ($(ADK_TARGET_FS),squashfs)
	env PATH=$(HOST_PATH) qemu-img create -f raw $(FW_DIR)/$(ROOTFSSQUASHFS) $(ADK_TARGET_MTD_SIZE) >/dev/null 2>&1
	dd conv=notrunc if=$(BUILD_DIR)/root.squashfs of=$(FW_DIR)/$(ROOTFSSQUASHFS) >/dev/null 2>&1
endif

# filesystem specific targets
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: kernel-install $(FW_DIR)/$(INITRAMFS) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfs-archive)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs targethelp
endif
ifeq ($(ADK_TARGET_FS),squashfs)
imageinstall: kernel-install $(BUILD_DIR)/root.squashfs targethelp
endif
ifeq ($(ADK_TARGET_FS),jffs2)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSJFFS2) targethelp
endif
