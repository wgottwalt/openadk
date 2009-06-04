# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		popt
PKG_VERSION:=		1.15
PKG_RELEASE:=		2
PKG_MD5SUM:=		c61ef795fa450eb692602a661ec8d7f1
PKG_DESCR:=		a command line option parsing library
PKG_SECTION:=		libs
PKG_URL:=		http://rpm5.org
PKG_SITES:=		http://rpm5.org/files/popt/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPOPT,libpopt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		am_cv_func_iconv=no
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBPOPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpopt.so.* ${IDIR_LIBPOPT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
