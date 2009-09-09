# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

define rootfs_template
ifeq ($(ADK_TARGET_ROOTFS_$(2)),y)
FS:=$(1)
FS_CMDLINE:=$(3)
endif
endef

ifeq ($(ADK_LINUX_MIPS_RB532),y)
ROOTFS:=	root=/dev/sda2
endif

$(eval $(call rootfs_template,ext2-cf,EXT2_CF,$(ROOTFS)))
$(eval $(call rootfs_template,ext2-mmc,EXT2_MMC))
$(eval $(call rootfs_template,archive,ARCHIVE))
$(eval $(call rootfs_template,initramfs,INITRAMFS))
$(eval $(call rootfs_template,initramfs-piggyback,INITRAMFS_PIGGYBACK))
$(eval $(call rootfs_template,squashfs,SQUASHFS))
$(eval $(call rootfs_template,yaffs,YAFFS))
$(eval $(call rootfs_template,nfsroot,NFSROOT,root=/dev/nfs ip=dhcp))
$(eval $(call rootfs_template,encrypted,ENCRYPTED))

export FS
