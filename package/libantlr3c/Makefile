# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libantlr3c
PKG_VERSION:=		3.2
PKG_RELEASE:=		2
PKG_HASH:=		2ccfb8a8bdd3d6c1d60742ff3a5a954af6d5a8d7f8901c87229fc6fa540ac99a
PKG_DESCR:=		another tool for language recognition
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://www.antlr.org/download/C/
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBANTLR3C,libantlr3c,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_ENV+=		OPTIMFLAGS="$(TARGET_CFLAGS)"

libantlr3c-install:
	${INSTALL_DIR} ${IDIR_LIBANTLR3C}/usr/lib
	${CP} ${WRKINST}/usr/lib/libantlr3c.so* ${IDIR_LIBANTLR3C}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
