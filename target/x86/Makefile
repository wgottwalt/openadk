# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

ifeq ($(ADK_TARGET_FS),genext2fs)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to CompactFlash use scripts/genext2.sh"
endif

ifeq ($(ADK_TARGET_FS),cf)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to CompactFlash use scripts/install.sh"
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The linux kernel is here: $(BIN_DIR)/$(TARGET_KERNEL)'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_HARDWARE_QEMU),y)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-i386 -nographic -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -kernel $(BIN_DIR)/$(TARGET_KERNEL) qemu-${CPU_ARCH}.img'
endif
ifeq ($(ADK_HARDWARE_VBOX),y)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo "Use following command to create a VirtualBox Image:"
	@echo "./scripts/create.sh -T vdi vbox-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
endif
endif
ifeq ($(ADK_TARGET_FS),usb)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to USB use scripts/install.sh"
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/$(TARGET_KERNEL)
	@echo 'The kernel file is: $(BIN_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-i386 -nographic -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -kernel $(BIN_DIR)/$(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/${TARGET_KERNEL}
	@echo 'The kernel+initramfs file is: $(BIN_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_HARDWARE_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-i386 -nographic -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -kernel $(BIN_DIR)/$(TARGET_KERNEL)'
endif
ifeq (${ADK_TARGET_FS},iso)
imageinstall: ${BIN_DIR}/${ROOTFSISO}
	@echo 'ISO image is at $<'
endif
endif
