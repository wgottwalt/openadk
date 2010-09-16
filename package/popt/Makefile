# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		popt
PKG_VERSION:=		1.15
PKG_RELEASE:=		2
PKG_MD5SUM:=		c61ef795fa450eb692602a661ec8d7f1
PKG_DESCR:=		a command line option parsing library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libiconv
PKG_BUILDDEP:=		libiconv
PKG_URL:=		http://rpm5.org/
PKG_SITES:=		http://rpm5.org/files/popt/

PKG_SUBPKGS:=		LIBPOPT

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPOPT,libpopt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBPOPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpopt.so* ${IDIR_LIBPOPT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
