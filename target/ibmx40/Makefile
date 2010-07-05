# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/arch/x86/boot/bzImage

createinitcrypt:
	$(SED) 's#^CONFIG_INITRAMFS_SOURCE.*#CONFIG_INITRAMFS_SOURCE="./initramfs_list"#' $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_ROOT_UID=0' >> $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_ROOT_GID=0' >> $(LINUX_DIR)/.config
	echo N |$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" oldconfig $(MAKE_TRACE) 
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" $(MAKE_TRACE)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel

ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@cp $(KERNEL) ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(FS),usb)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
	@echo "To install everything to USB use scripts/install.sh"
endif
ifeq ($(FS),initramfs-piggyback)
imageinstall: ${BUILD_DIR}/${INITRAMFS_PIGGYBACK} createinitramfs
	@cp $(KERNEL) ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
endif
ifeq ($(FS),encrypted)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL) createinitcrypt
	@echo 'The kernel+cryptinit file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSUSERTARBALL)"
	@echo 'Boot your IBM X40 via NFS or USB.'
	@echo 'Then create at least three partitions with fdisk:'
	@echo '/dev/sda1 (ext2)'
	@echo '/dev/sda2 (encrypted root)'
	@echo '/dev/sda3 (swap)'
	@echo 'mkdir /mnt/{boot,root}'
	@echo 'mke2fs /dev/sda1'
	@echo 'cryptsetup luksFormat /dev/sda2'
	@echo 'cryptsetup luksFormat /dev/sda3'
	@echo 'cryptsetup luksOpen /dev/sda2 root'
	@echo 'cryptsetup luksOpen /dev/sda3 swap'
	@echo 'mkfs.xfs /dev/mapper/root'
	@echo 'mkswap /dev/mapper/swap'
	@echo 'mount /dev/sda1 /mnt/boot'
	@echo 'mount /dev/mapper/crypt /mnt/root'
	@echo 'mkdir /mnt/boot/boot'
	@echo 
	@echo 'Copy $(ROOTFSUSERTARBALL) via scp to /mnt/root and extract it'
	@echo 'cd /mnt/root ; gunzip $(ROOTFSUSERTARBALL); tar xpvf $(ROOTFSUSERTARBALL)'
	@echo 'cd /mnt/root ; mknod -m 644 console c 5 1'
endif
