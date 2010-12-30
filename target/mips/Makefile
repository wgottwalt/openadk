# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinux
OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

kernel-install:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) \
		$(TARGET_DIR)/boot/kernel

ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(TARGET_DIR)/boot/kernel $(TARGET_KERNEL)
	@echo 'The kernel file is: ${TARGET_KERNEL}'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),yaffs)
imageinstall: kernel-install $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo 'The root tarball is: ${BIN_DIR}/${ROOTFSTARBALL}'
	@echo 'Format your NAND with Routerboot, boot via NFS and'
	@echo 'then install kernel and filesystem via:'
	@echo 'adkinstall ${ROOTFSTARBALL}'
endif
ifeq ($(ADK_TARGET_FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(TARGET_DIR)/boot/kernel $(TARGET_KERNEL)
	@echo 'The kernel file is: ${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Use following command to create a QEMU Image:"
	@echo "sudo ./scripts/create-image.sh -f $(ADK_TARGET_ROOTFS) qemu-${CPU_ARCH}.img $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-mips -nographic -M malta -kernel $(TARGET_KERNEL) -hda qemu-${CPU_ARCH}.img -append "root=/dev/hda1"'
endif
ifeq ($(ADK_TARGET_FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(TARGET_KERNEL)
	@echo 'The kernel file is: ${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
	@echo 'qemu-system-mips -nographic -M malta -kernel $(TARGET_KERNEL) -initrd ${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(ADK_TARGET_FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) $(TARGET_KERNEL)
	@echo 'The kernel+initramfs file is: ${TARGET_KERNEL}'
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-mips -nographic -M malta -kernel $(TARGET_KERNEL)'
endif
