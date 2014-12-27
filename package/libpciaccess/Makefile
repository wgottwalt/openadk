# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libpciaccess
PKG_VERSION:=		0.13.2
PKG_RELEASE:=		1
PKG_HASH:=		b5459e347166113cefac80003dc5c431a8399ae936b3efcd2cef6437fbe88602
PKG_DESCR:=		pci access library
PKG_SECTION:=		x11/libs
PKG_SITES:=		${MASTER_SITE_XORG}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCIACCESS,libpciaccess,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libpciaccess-install:
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpciaccess.so* \
		${IDIR_LIBPCIACCESS}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
