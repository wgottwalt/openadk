# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		1.98
PKG_RELEASE:=		1
PKG_MD5SUM:=		c0bcf60e524739bb64e3a2d4e3732a59
PKG_DESCR:=		GRUB2 bootloader (source package)
PKG_SECTION:=		base
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		ftp://alpha.gnu.org/gnu/grub/

PKG_HOST_DEPENDS:=	linux
PKG_ARCH_DEPENDS:=	x86 x86_64
PKG_NOPARALLEL:=	1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRUB,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=         -static
TARGET_LDFLAGS+=        -static
endif

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s  CPPFLAGS_FOR_BUILD="-I./include"
CONFIGURE_ARGS+=	--disable-efiemu \
			--disable-grub-mkfont \
			--disable-grub-fstest

post-install:
	${INSTALL_DIR} $(IDIR_GRUB)/usr/{sbin,lib,bin}
	${INSTALL_DIR} $(IDIR_GRUB)/etc
	${CP} ${WRKINST}/etc/grub.d $(IDIR_GRUB)/etc
	${CP} ${WRKINST}/usr/lib/* $(IDIR_GRUB)/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/* $(IDIR_GRUB)/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/* $(IDIR_GRUB)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
