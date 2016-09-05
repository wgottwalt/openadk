# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		2.00
PKG_RELEASE:=		6
PKG_HASH:=		784ec38e7edc32239ad75b8e66df04dc8bfb26d88681bc9f627133a6eb85c458
PKG_DESCR:=		multiboot boot loader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		bison-host
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		ftp://ftp.gnu.org/gnu/grub/
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	x86 x86_64

PKG_SUBPKGS:=		GRUB GRUB_TOOLS
PKGSD_GRUB_TOOLS:=	grub2 tools

PKG_CHOICES_GRUB:=	PC EFI_X86 EFI_X86_64
PKGCD_PC:=		build for PC BIOS
PKGCD_EFI_X86:=		build for EFI x86
PKGCD_EFI_X86_64:=	build for EFI x86_64

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GRUB_TOOLS,grub-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=$(filter-out -fstack-protector-all,$(TARGET_CFLAGS))
TARGET_CFLAGS:=$(filter-out -flto,$(TARGET_CFLAGS))

GRUB2_BOOT_PARTITION:=	hd0,msdos1

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
GRUB2_IMAGE = $(FW_DIR)/grub.img
GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
GRUB2_TUPLE = i386-pc
GRUB2_TARGET = i386
GRUB2_PLATFORM = pc
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal biosdisk
endif

ifeq ($(ADK_PACKAGE_GRUB_EFI_X86),y)
GRUB2_IMAGE = $(FW_DIR)/efi-part/EFI/BOOT/bootia32.efi
GRUB2_CFG = $(FW_DIR)/efi-part/EFI/BOOT/grub.cfg
GRUB2_PREFIX = /EFI/BOOT
GRUB2_TUPLE = i386-efi
GRUB2_TARGET = i386
GRUB2_PLATFORM = efi
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal efi_gop
endif

ifeq ($(ADK_PACKAGE_GRUB_EFI_X86_64),y)
GRUB2_IMAGE = $(FW_DIR)/efi-part/EFI/BOOT/bootx64.efi
GRUB2_CFG = $(FW_DIR)/efi-part/EFI/BOOT/grub.cfg
GRUB2_PREFIX = /EFI/BOOT
GRUB2_TUPLE = x86_64-efi
GRUB2_TARGET = x86_64
GRUB2_PLATFORM = efi
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal efi_gop
endif

# core.img is generated via
# grub-mkimage -O ${GRUB_ARCH} -o core.img -c embed.cfg ${GRUB_MODULES}
GRUB_MODULES:=		ext2 part_msdos biosdisk

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
GRUB_ARCH:=		i386-pc
CONFIGURE_ARGS+=	--with-platform=pc
endif
ifeq ($(ADK_PACKAGE_GRUB_EFI_X86)$(ADK_PACKAGE_GRUB_EFI_X86_64),y)
GRUB_ARCH:=		x86_64-efi
CONFIGURE_ARGS+=	--with-platform=efi
endif

CONFIGURE_ARGS+=	--disable-grub-mkfont \
			--enable-efiemu=no \
			--enable-device-mapper=no \
			--enable-libzfs=no \
			--disable-werror
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

grub-install:
	${INSTALL_DIR} $(IDIR_GRUB)/boot/grub/${GRUB_ARCH}
	${CP} ${WRKINST}/usr/lib/grub/${GRUB_ARCH}/*{mod,lst,img} \
		$(IDIR_GRUB)/boot/grub/${GRUB_ARCH}/
	$(STAGING_HOST_DIR)/usr/bin/grub-mkimage \
		-d $(STAGING_HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
		-O $(GRUB2_TUPLE) \
		-o $(GRUB2_IMAGE) \
		-p "$(GRUB2_PREFIX)" \
		$(GRUB2_MODULES)
ifeq ($(ADK_PACKAGE_GRUB_PC),y)
	$(CP) ./files/core.img.${GRUB_ARCH} \
		$(IDIR_GRUB)/boot/grub/core.img
	$(CP) $(WRKINST)/usr/lib/grub/i386-pc/boot.img \
		$(FW_DIR)/
endif

grub-tools-install:
	${INSTALL_DIR} $(IDIR_GRUB_TOOLS)/usr/{sbin,bin,share,lib}
	${INSTALL_BIN} ${WRKINST}/usr/sbin/grub-install \
		$(IDIR_GRUB_TOOLS)/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/grub-probe \
		$(IDIR_GRUB_TOOLS)/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/grub-bios-setup \
		$(IDIR_GRUB_TOOLS)/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/grub-editenv \
		$(IDIR_GRUB_TOOLS)/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/grub-mkrelpath \
		$(IDIR_GRUB_TOOLS)/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/grub-mkimage \
		$(IDIR_GRUB_TOOLS)/usr/bin
	${CP} ${WRKINST}/usr/lib/grub \
		$(IDIR_GRUB_TOOLS)/usr/lib
	${CP} ${WRKINST}/usr/share/grub \
		$(IDIR_GRUB_TOOLS)/usr/share

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
