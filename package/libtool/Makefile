# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtool
PKG_VERSION:=		1.5.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		8e0ac9797b62ba4dcc8a2fb7936412b0
PKG_DESCR:=		a generic dynamic object loading library
PKG_SECTION:=		libs
PKG_URL:=		http://www.gnu.org/software/libtool
PKG_SITES:=		${MASTER_SITE_GNU:=libtool/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBLTDL,libltdl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBLTDL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libltdl.so.* ${IDIR_LIBLTDL}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
