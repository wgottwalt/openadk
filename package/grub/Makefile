# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		2.00
PKG_RELEASE:=		6
PKG_MD5SUM:=		a1043102fbc7bcedbf53e7ee3d17ab91
PKG_DESCR:=		multiboot boot loader
PKG_SECTION:=		base/boot
PKG_BUILDDEP:=		bison-host
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		ftp://ftp.gnu.org/gnu/grub/

PKG_ARCH_DEPENDS:=	x86 x86_64 mips
PKG_SYSTEM_DEPENDS:=	!mikrotik-rb532
PKG_NOPARALLEL:=	1

PKG_SUBPKGS:=		GRUB GRUB_TOOLS
PKGSD_GRUB_TOOLS:=	grub2 tools

PKG_CHOICES_GRUB:=	PC EFI
PKGCD_PC:=		build for PC BIOS
PKGCD_EFI:=		build for EFI

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,GRUB_TOOLS,grub-tools,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=          $(filter-out -fstack-protector-all,$(TARGET_CFLAGS))

# core.img is generated via
# grub-mkimage -O ${GRUB_ARCH} -o core.img -c embed.cfg ${GRUB_MODULES}
GRUB_MODULES:=		ext2 part_msdos biosdisk

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
GRUB_ARCH:=		i386-pc
CONFIGURE_ARGS+=	--with-platform=pc
endif
ifeq ($(ADK_PACKAGE_GRUB_EFI),y)
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
	-${CP} ./files/core.img.${GRUB_ARCH} \
		$(IDIR_GRUB)/boot/grub/core.img

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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
