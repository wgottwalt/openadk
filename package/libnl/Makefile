# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnl
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ae970ccd9144e132b68664f98e7ceeb1
PKG_DESCR:=		Netlink library
PKG_SECTION:=		libs
PKG_SITES:=		http://downloads.openwrt.org/sources/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNL,libnl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBNL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnl.so* ${IDIR_LIBNL}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
