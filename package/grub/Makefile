# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		2.00
PKG_RELEASE:=		2
PKG_MD5SUM:=		e927540b6eda8b024fb0391eeaa4091c
PKG_DESCR:=		GRUB2 bootloader (source package)
PKG_SECTION:=		boot
PKG_BUILDDEP:=		bison-host
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		ftp://ftp.gnu.org/gnu/grub/

PKG_ARCH_DEPENDS:=	x86 x86_64 mips
PKG_NOPARALLEL:=	1

PKG_CHOICES_GRUB:=	PC EFI
PKGCD_PC:=		build for PC BIOS
PKGCD_EFI:=		build for EFI

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRUB,grub,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_PACKAGE_GRUB_PC),y)
GRUB_ARCH:=		i386-pc
CONFIGURE_ARGS+=	--with-platform=pc
endif
ifeq ($(ADK_PACKAGE_GRUB_EFI),y)
GRUB_ARCH:=		x86_64-efi
CONFIGURE_ARGS+=	--with-platform=efi
endif

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=         -static
TARGET_LDFLAGS+=        -static
endif

CONFIGURE_ARGS+=	--disable-grub-mkfont
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

grub-install:
	${INSTALL_DIR} $(IDIR_GRUB)/usr/{sbin,bin}
	${INSTALL_DIR} $(IDIR_GRUB)/usr/lib/grub/${GRUB_ARCH}/
	${INSTALL_DIR} $(IDIR_GRUB)/etc
	${CP} ${WRKINST}/etc/grub.d $(IDIR_GRUB)/etc
	${CP} ${WRKINST}/usr/lib/grub/${GRUB_ARCH}/*{mod,lst,img} \
		$(IDIR_GRUB)/usr/lib/grub/${GRUB_ARCH}/
	${INSTALL_BIN} ${WRKINST}/usr/bin/* $(IDIR_GRUB)/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/* $(IDIR_GRUB)/usr/sbin
	${CP} ./files/core.img.${GRUB_ARCH} \
		$(IDIR_GRUB)/usr/lib/grub/core.img

include ${TOPDIR}/mk/pkg-bottom.mk
