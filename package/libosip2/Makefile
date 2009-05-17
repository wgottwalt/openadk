# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libosip2
PKG_VERSION:=		2.2.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		f1237af0250c59b318bd64a59f5750ea
MASTER_SITES:=		${MASTER_SITE_GNU:=osip/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOSIP2,libosip2,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--disable-trace \
			--enable-pthread \
			--enable-semaphore \
			--enable-ntimer
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBOSIP2}/usr/lib
	${CP} ${WRKINST}/usr/lib/libosip{,parser}2.so.* ${IDIR_LIBOSIP2}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
