# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtool
PKG_VERSION:=		2.2.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		b745d220e88163fcd9eea0a90ccf21b0
PKG_DESCR:=		a generic dynamic object loading library
PKG_SECTION:=		lang
PKG_URL:=		http://www.gnu.org/software/libtool
PKG_SITES:=		${MASTER_SITE_GNU:=libtool/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTOOL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBLTDL,libltdl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_HOST_OPENBSD},y)
XAKE_FLAGS+=		AUTOCONF_VERSION=2.62
endif

post-install:
	${INSTALL_DIR} ${IDIR_LIBLTDL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libltdl.so* ${IDIR_LIBLTDL}/usr/lib/
	${INSTALL_DIR} ${IDIR_LIBTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libtool ${IDIR_LIBTOOL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/libtoolize ${IDIR_LIBTOOL}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
