# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		popt
PKG_VERSION:=		1.16
PKG_RELEASE:=		1
PKG_MD5SUM:=		3743beefa3dd6247a73f8f7a32c14c33
PKG_DESCR:=		a command line option parsing library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libiconv
PKG_BUILDDEP:=		libiconv
PKG_URL:=		http://rpm5.org/
PKG_SITES:=		http://rpm5.org/files/popt/

PKG_SUBPKGS:=		LIBPOPT

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBPOPT,libpopt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_LIBPOPT}/usr/lib
	${CP} ${WRKINST}/usr/lib/libpopt.so* ${IDIR_LIBPOPT}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
