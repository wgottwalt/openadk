# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		git
PKG_RELEASE:=		1
PKG_DESCR:=		multiboot boot loader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		bison-host grub-host
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		git://git.savannah.gnu.org/grub.git
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	x86 x86_64 mips mips64

PKG_SUBPKGS:=		GRUB GRUB_TOOLS
PKGSD_GRUB_TOOLS:=	grub2 tools

PKG_CHOICES_GRUB:=	PC EFI_X86 EFI_X86_64 ARC
PKGCD_PC:=		build for PC BIOS
PKGCD_EFI_X86:=		build for EFI x86
PKGCD_EFI_X86_64:=	build for EFI x86_64
PKGCD_ARC:=		build for MIPS/MIPS64 ARC

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GRUB_TOOLS,grub-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=$(filter-out -fstack-protector-all,$(TARGET_CFLAGS))
TARGET_CFLAGS:=$(filter-out -flto,$(TARGET_CFLAGS))

AUTOTOOL_STYLE:=	autogen

GRUB2_BOOT_PARTITION:=	hd0,msdos1

ifeq ($(ADK_PACKAGE_GRUB_ARC),y)
GRUB2_ARCH:=		mips-arc
CONFIGURE_ARGS+=	--with-platform=arc
GRUB2_IMAGE = $(FW_DIR)/grub.img
GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
GRUB2_TARGET = mips
GRUB2_PLATFORM = arc
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal biosdisk
endif

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
GRUB2_ARCH:=		i386-pc
CONFIGURE_ARGS+=	--with-platform=pc
HOST_CONFIGURE_ARGS+=	--with-platform=pc
GRUB2_IMAGE = $(FW_DIR)/grub.img
GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub
GRUB2_TARGET = i386
GRUB2_PLATFORM = pc
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal biosdisk
endif

ifeq ($(ADK_PACKAGE_GRUB_EFI_X86),y)
GRUB2_ARCH:=		x86_64-efi
CONFIGURE_ARGS+=	--with-platform=efi
HOST_CONFIGURE_ARGS+=	--with-platform=efi
GRUB2_IMAGE = $(FW_DIR)/efi-part/EFI/BOOT/bootia32.efi
GRUB2_CFG = $(FW_DIR)/efi-part/EFI/BOOT/grub.cfg
GRUB2_PREFIX = /EFI/BOOT
GRUB2_TARGET = i386
GRUB2_PLATFORM = efi
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal efi_gop
endif

ifeq ($(ADK_PACKAGE_GRUB_EFI_X86_64),y)
GRUB2_ARCH:=		x86_64-efi
CONFIGURE_ARGS+=	--with-platform=efi
HOST_CONFIGURE_ARGS+=	--with-platform=efi
GRUB2_IMAGE = $(FW_DIR)/efi-part/EFI/BOOT/bootx64.efi
GRUB2_CFG = $(FW_DIR)/efi-part/EFI/BOOT/grub.cfg
GRUB2_PREFIX = /EFI/BOOT
GRUB2_TARGET = x86_64
GRUB2_PLATFORM = efi
GRUB2_MODULES = boot linux ext2 fat part_msdos part_gpt normal efi_gop
endif

HOST_CONFIGURE_ARGS+=	--enable-efiemu=no \
			--disable-grub-mkfont \
			--enable-device-mapper=no \
			--enable-libzfs=no \
			--disable-werror
CONFIGURE_ARGS+=	--disable-grub-mkfont \
			--enable-efiemu=no \
			--enable-device-mapper=no \
			--enable-libzfs=no \
			--disable-werror
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

grub-install:
ifeq ($(ADK_PACKAGE_GRUB_EFI_X86)$(ADK_PACKAGE_GRUB_EFI_X86_64),y)
	$(INSTALL_DIR) $(FW_DIR)/efi-part/EFI/BOOT
	${CP} ${WRKINST}/usr/lib/grub/${GRUB2_ARCH} \
		$(FW_DIR)/efi-part/EFI/BOOT
endif
	$(STAGING_HOST_DIR)/usr/bin/grub-mkimage \
		-d $(WRKINST)/usr/lib/grub/$(GRUB2_ARCH) \
		-O $(GRUB2_ARCH) \
		-o $(GRUB2_IMAGE) \
		-p "$(GRUB2_PREFIX)" \
		$(GRUB2_MODULES)
	$(CP) ./files/grub.cfg $(GRUB2_CFG)

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
