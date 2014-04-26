# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libdaemon
PKG_VERSION:=		0.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		509dc27107c21bcd9fbf2f95f5669563
PKG_DESCR:=		library that eases the writing of UNIX daemons
PKG_SECTION:=		libs
PKG_URL:=		http://0pointer.de/lennart/projects/libdaemon/
PKG_SITES:=		http://0pointer.de/lennart/projects/libdaemon/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBDAEMON,libdaemon,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=		ac_cv_func_setpgrp_void=yes
CONFIGURE_ARGS+=	--disable-lynx \
			--disable-examples

libdaemon-install:
	${INSTALL_DIR} ${IDIR_LIBDAEMON}/usr/lib
	${CP} ${WRKINST}/usr/lib/libdaemon.so* ${IDIR_LIBDAEMON}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
