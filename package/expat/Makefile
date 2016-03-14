# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		expat
PKG_VERSION:=		2.1.1
PKG_RELEASE:=		1
PKG_HASH:=		aff584e5a2f759dcfc6d48671e9529f6afe1e30b0cd6a4cec200cbe3f793de67
PKG_DESCR:=		xml parsing library
PKG_SECTION:=		libs/data
PKG_URL:=		http://expat.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=expat/}
PKG_LIBNAME:=		libexpat
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,LIBEXPAT,libexpat,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBEXPAT,libexpat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

libexpat-install:
	${INSTALL_DIR} ${IDIR_LIBEXPAT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libexpat.so* ${IDIR_LIBEXPAT}/usr/lib/

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
