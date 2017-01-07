# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		28511b0da900876151c71b66885b89615c68cfa4
PKG_RELEASE:=		1
PKG_DESCR:=		multiboot boot loader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		bison-host grub-host
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		git://git.savannah.gnu.org/grub.git
PKG_NOPARALLEL:=	1

PKG_ARCH_DEPENDS:=	x86 x86_64 mips mips64 ppc ppc64

PKG_SUBPKGS:=		GRUB GRUB_TOOLS
PKGSD_GRUB_TOOLS:=	grub2 tools

PKG_CHOICES_GRUB:=	PC EFI_X86 EFI_X86_64 ARC IEEE1275
PKGCD_PC:=		build for PC BIOS
PKGCD_EFI_X86:=		build for EFI x86
PKGCD_EFI_X86_64:=	build for EFI x86_64
PKGCD_ARC:=		build for MIPS/MIPS64 ARC
PKGCD_IEEE1275:=	build for OpenFirmware

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GRUB_TOOLS,grub-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=$(filter-out -fstack-protector-all,$(TARGET_CFLAGS))
TARGET_CFLAGS:=$(filter-out -flto,$(TARGET_CFLAGS))

AUTOTOOL_STYLE:=	autogen

ifeq ($(ADK_PACKAGE_GRUB_ARC),y)
GRUB_ARCH=		mips-arc
GRUB_IMAGE=		grub.img
GRUB_DIR=		boot/grub
GRUB_PREFIX=		(hd0,msdos1)/boot/grub
GRUB_TARGET=		mips
GRUB_PLATFORM=		arc
GRUB_MODULES=		boot linux ext2 fat part_msdos part_gpt normal
endif

ifeq ($(ADK_PACKAGE_GRUB_IEEE1275),y)
GRUB_ARCH=		powerpc-ieee1275
GRUB_IMAGE=		grub.img
GRUB_DIR=		boot/grub
GRUB_PREFIX=		(hd0,msdos1)/boot/grub
GRUB_TARGET=		powerpc
GRUB_PLATFORM=		ieee1275
GRUB_MODULES=		boot linux ext2 fat part_msdos part_gpt normal
endif

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
HOST_CONFIGURE_ARGS+=	--with-platform=pc
GRUB_ARCH=		i386-pc
GRUB_IMAGE=		grub.img
GRUB_DIR=		boot/grub
GRUB_PREFIX=		(hd0,msdos1)/boot/grub
GRUB_TARGET=		i386
GRUB_PLATFORM=		pc
GRUB_MODULES=		boot linux ext2 fat part_msdos part_gpt normal biosdisk
endif

ifeq ($(ADK_PACKAGE_GRUB_EFI_X86),y)
HOST_CONFIGURE_ARGS+=	--with-platform=efi
GRUB_ARCH=		i386-efi
GRUB_IMAGE=		efi-part/EFI/BOOT/bootia32.efi
GRUB_DIR=		efi-part/EFI/BOOT
GRUB_PREFIX=		/EFI/BOOT
GRUB_TARGET=		i386
GRUB_PLATFORM=		efi
GRUB_MODULES=		boot linux ext2 fat part_msdos part_gpt normal efi_gop
endif

ifeq ($(ADK_PACKAGE_GRUB_EFI_X86_64),y)
HOST_CONFIGURE_ARGS+=	--with-platform=efi
GRUB_ARCH=		x86_64-efi
GRUB_IMAGE=		efi-part/EFI/BOOT/bootx64.efi
GRUB_DIR=		efi-part/EFI/BOOT
GRUB_PREFIX=		/EFI/BOOT
GRUB_TARGET=		x86_64
GRUB_PLATFORM=		efi
GRUB_MODULES=		boot linux ext2 fat part_msdos part_gpt normal efi_gop
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
			--with-platform=$(GRUB_PLATFORM) \
			--disable-werror
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

grub-install:
	$(INSTALL_DIR) $(FW_DIR)/$(GRUB_DIR)
	$(INSTALL_DIR) $(IDIR_GRUB)/$(GRUB_DIR)
ifeq ($(ADK_PACKAGE_GRUB_PC),y)
	$(STAGING_HOST_DIR)/usr/bin/grub-mkimage \
		-d $(WRKINST)/usr/lib/grub/$(GRUB_ARCH) \
		-O $(GRUB_ARCH) \
		-p "$(GRUB_PREFIX)" \
		-o $(IDIR_GRUB)/$(GRUB_DIR)/core.img \
		-c ./files/embed.cfg ext2 part_msdos biosdisk
endif
ifeq ($(ADK_PACKAGE_GRUB_EFI_X86)$(ADK_PACKAGE_GRUB_EFI_X86_64),y)
	${CP} ${WRKINST}/usr/lib/grub/$(GRUB_ARCH) \
		$(FW_DIR)/$(GRUB_DIR)
	$(CP) ./files/grub.cfg $(FW_DIR)/$(GRUB_DIR)
else
	${CP} ${WRKINST}/usr/lib/grub/${GRUB_ARCH} \
		$(IDIR_GRUB)/$(GRUB_DIR)
	$(CP) ./files/grub.cfg $(IDIR_GRUB)/$(GRUB_DIR)
endif
	$(STAGING_HOST_DIR)/usr/bin/grub-mkimage \
		-d $(WRKINST)/usr/lib/grub/$(GRUB_ARCH) \
		-O $(GRUB_ARCH) \
		-o $(FW_DIR)/$(GRUB_IMAGE) \
		-p "$(GRUB_PREFIX)" \
		$(GRUB_MODULES)

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
