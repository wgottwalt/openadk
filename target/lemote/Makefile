# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk
include $(TOPDIR)/mk/kernel.mk
include $(TOPDIR)/mk/modules.mk
include $(TOPDIR)/mk/kernel-build.mk
include $(TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinuz

createinitcrypt:
	$(SED) 's#^CONFIG_INITRAMFS_SOURCE.*#CONFIG_INITRAMFS_SOURCE="./initramfs_list"#' $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_ROOT_UID=0' >> $(LINUX_DIR)/.config
	echo 'CONFIG_INITRAMFS_ROOT_GID=0' >> $(LINUX_DIR)/.config
	echo N |$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" oldconfig $(MAKE_TRACE)
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(ARCH) \
		CC="$(TARGET_CC)" $(MAKE_TRACE)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel

ifeq ($(FS),nfsroot)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The nfs root tarball is: ${BIN_DIR}/${ROOTFSUSERTARBALL}'
	@echo 'Boot your lemote and type following commands in PMON:'
	@echo 'PMON> ifaddr rtl0 <ip-address-client>'
	@echo 'PMON> load tftp://<ip-address-server>/${ADK_TARGET}-${FS}-kernel'
	@echo 'PMON> g'
endif
ifeq ($(FS),initramfs)
imageinstall: $(BIN_DIR)/$(INITRAMFS)
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo 'The initramfs image is: ${BIN_DIR}/${INITRAMFS}'
endif
ifeq ($(FS),initramfs-piggyback)
imageinstall: $(BUILD_DIR)/$(INITRAMFS_PIGGYBACK) createinitramfs
	@cp $(KERNEL) $(BIN_DIR)/${ADK_TARGET}-${FS}-kernel
	@echo 'The kernel+initramfs file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
endif
ifeq ($(FS),archive)
imageinstall: $(BIN_DIR)/$(ROOTFSTARBALL)
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSTARBALL)"
endif
ifeq ($(FS),encrypted)
imageinstall: $(BIN_DIR)/$(ROOTFSUSERTARBALL) createinitcrypt
	@echo 'The kernel+cryptinit file is: ${BIN_DIR}/${ADK_TARGET}-${FS}-kernel'
	@echo "The RootFS tarball is: $(BIN_DIR)/$(ROOTFSUSERTARBALL)"
	@echo 'Boot your lemote via NFS or USB.'
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
	@echo 'Copy $(ROOTFSUSERTARBALL) via scp to /mnt/root and extract it'
	@echo 'cd /mnt/root ; gunzip $(ROOTFSUSERTARBALL); tar xpvf $(ROOTFSUSERTARBALL)'
	@echo 'Copy ${ADK_TARGET}-${FS}-kernel via scp to /mnt/boot/boot'
	@echo 'Move boot.cfg to /mnt/boot/boot'
	@echo 'mv /mnt/root/boot/boot.cfg /mnt/boot/boot'
	@echo 'cd /mnt/root ; mknod -m 644 console c 5 1'
endif
