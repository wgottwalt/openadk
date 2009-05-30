# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libosip2
PKG_VERSION:=		3.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		81493bb4d4ae6d55b71a0d4369339125
PKG_DESCR:=		GNU oSIP library, a SIP (Session Initiation Protocol) implementation
PKG_SECTION:=		libs
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.gnu.org/software/osip
PKG_SITES:=		${MASTER_SITE_GNU:=osip/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBOSIP2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
