# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		grub
PKG_VERSION:=		1.97.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		66fe18cd9318e3d67a34d7b7a8e7b1f6
PKG_DESCR:=		GRand Unified Bootloader
PKG_SECTION:=		base
PKG_URL:=		http://www.gnu.org/software/grub
PKG_SITES:=		ftp://alpha.gnu.org/gnu/grub/

PKG_HOST_DEPENDS:=	linux
PKG_TARGET_DEPENDS:=    x86 x86_64

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GRUB,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-grub-emu \
			--disable-efiemu \
			--disable-grub-mkfont \
			--disable-grub-fstest
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} $(IDIR_GRUB)/usr/{sbin,lib,bin} 
	${INSTALL_DIR} $(IDIR_GRUB)/etc
	${CP} ${WRKINST}/etc/grub.d $(IDIR_GRUB)/etc
	${CP} ${WRKINST}/usr/lib/* $(IDIR_GRUB)/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/bin/* $(IDIR_GRUB)/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/* $(IDIR_GRUB)/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
