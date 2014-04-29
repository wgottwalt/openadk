# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

QEMU_ARGS:=-M pc
QEMU_ARGS+=${ADK_QEMU_ARGS}

ifeq ($(ADK_TARGET_SYSTEM_QEMU_X86_64_32),y)
QEMU_ARCH:=x86_84
else
QEMU_ARCH:=i386
endif

ifeq ($(ADK_TARGET_QEMU_WITH_BOOTLOADER),y)
ifeq ($(ADK_TARGET_QEMU_WITHOUT_GRAPHIC),y)
CREATE:=./scripts/create.sh -g -t
else
CREATE:=./scripts/create.sh -g
endif
else
CREATE:=./scripts/create.sh
endif

ifeq ($(ADK_TARGET_FS),genext2fs)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to CompactFlash use scripts/genext2.sh"
endif
ifeq ($(ADK_TARGET_FS),cf)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to CompactFlash use scripts/install.sh"
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The linux kernel is here: $(FW_DIR)/$(TARGET_KERNEL)'
	@echo 'The nfs root tarball is: ${FW_DIR}/${ROOTFSUSERTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_HARDWARE_QEMU),y)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo "Use following command to create a QEMU Image:"
	@echo "$(CREATE) qemu-${CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following command line:"
ifeq ($(ADK_TARGET_QEMU_WITH_BOOTLOADER),y)
	@echo 'qemu-system-${QEMU_ARCH} ${QEMU_ARGS} -net user -net nic,model=e1000 qemu-${CPU_ARCH}.img'
else
	@echo 'qemu-system-${QEMU_ARCH} ${QEMU_ARGS} -net user -net nic,model=e1000 -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
endif
ifeq ($(ADK_HARDWARE_VBOX),y)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo "Use following command to create a VirtualBox Image:"
	@echo "./scripts/create.sh -T vdi vbox-${CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
endif
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: $(FW_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(FW_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
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
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${QEMU_ARCH} ${QEMU_ARGS} -net user -net nic,model=e1000 -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(FW_DIR)/${TARGET_KERNEL}
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${QEMU_ARCH} ${QEMU_ARGS} -net user -net nic,model=e1000 -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq (${ADK_TARGET_FS},iso)
imageinstall: ${FW_DIR}/${ROOTFSISO}
	@echo 'ISO image is at $<'
endif
