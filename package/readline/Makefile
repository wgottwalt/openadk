# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		readline
PKG_VERSION:=		6.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		fc2f7e714fe792db1ce6ddc4c9fb4ef3
PKG_DESCR:=		Command line editing library
PKG_SECTION:=		libs
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		${MASTER_SITE_GNU:=readline/}

PKG_SUBPKGS:=		LIBREADLINE LIBREADLINE_DEV
PKGSD_LIBREADLINE_DEV:=	readline headers
PKGSC_LIBREADLINE_DEV:=	devel

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBREADLINE,libreadline,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBREADLINE_DEV,libreadline-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBREADLINE_DEV},${PKGSC_LIBREADLINE_DEV}))

CONFIGURE_ARGS+= 	--with-curses

libreadline-install:
	${INSTALL_DIR} ${IDIR_LIBREADLINE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libhistory.so* ${IDIR_LIBREADLINE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libreadline.so* ${IDIR_LIBREADLINE}/usr/lib

libreadline-dev-install:
	${INSTALL_DIR} ${IDIR_LIBREADLINE_DEV}/usr/include/readline
	${CP} ${WRKINST}/usr/include/readline/*.h \
		${IDIR_LIBREADLINE_DEV}/usr/include/readline

include ${TOPDIR}/mk/pkg-bottom.mk
