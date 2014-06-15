# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		readline
PKG_VERSION:=		6.1
PKG_RELEASE:=		2
PKG_MD5SUM:=		fc2f7e714fe792db1ce6ddc4c9fb4ef3
PKG_DESCR:=		command line editing library
PKG_SECTION:=		libs/misc
PKG_DEPENDS:=		libncurses
PKG_BUILDDEP:=		ncurses
PKG_SITES:=		${MASTER_SITE_GNU:=readline/}
PKG_LIBNAME:=		libreadline
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,READLINE,readline,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,LIBREADLINE,libreadline,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ARGS+= 	--with-curses

libreadline-install:
	${INSTALL_DIR} ${IDIR_LIBREADLINE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libhistory.so* ${IDIR_LIBREADLINE}/usr/lib
	${CP} ${WRKINST}/usr/lib/libreadline.so* ${IDIR_LIBREADLINE}/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
