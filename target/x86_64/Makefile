# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo 'The RootFS tarball is: ${FW_DIR}/${ROOTFSTARBALL}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_X86_64),y)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh qemu-${CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-x86_64 ${ADK_QEMU_ARGS} -net user -net nic,model=e1000 -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to USB use scripts/install.sh"
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(FW_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_X86_64),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-x86_64 ${ADK_QEMU_ARGS} -net user -net nic,model=e1000 -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_SYSTEM_QEMU_X86_64),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-x86_64 ${ADK_QEMU_ARGS} -net user -net nic,model=e1000 -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The linux kernel is here: $(FW_DIR)/$(TARGET_KERNEL)'
	@echo 'The nfs root tarball is: ${FW_DIR}/${ROOTFSUSERTARBALL}'
endif
