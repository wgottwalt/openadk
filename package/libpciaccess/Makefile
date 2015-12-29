# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		libpciaccess
PKG_VERSION:=		0.13.4
PKG_RELEASE:=		1
PKG_HASH:=		74d92bda448e6fdb64fee4e0091255f48d625d07146a121653022ed3a0ca1f2f
PKG_DESCR:=		pci access library
PKG_SECTION:=		x11/libs
PKG_SITES:=		http://www.x.org/releases/individual/lib/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCIACCESS,libpciaccess,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libpciaccess-install:
	${INSTALL_DIR} ${IDIR_LIBPCIACCESS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpciaccess.so* \
		${IDIR_LIBPCIACCESS}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
