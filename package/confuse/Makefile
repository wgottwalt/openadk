# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		confuse
PKG_VERSION:=		3.0
PKG_RELEASE:=		1
PKG_HASH:=		f1f326d9443103036d19c32d3f3efec3a85c3b081d99534463668d29992c4648
PKG_DESCR:=		configuration file parser library
PKG_SECTION:=		libs/misc
PKG_URL:=		https://github.com/martinh/libconfuse
PKG_SITES:=		https://github.com/martinh/libconfuse/releases/download/v$(PKG_VERSION)/
PKG_LIBNAME:=		libconfuse
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,CONFUSE,confuse,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBCONFUSE,libconfuse,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libconfuse-install:
	${INSTALL_DIR} ${IDIR_LIBCONFUSE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libconfuse.so* ${IDIR_LIBCONFUSE}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
