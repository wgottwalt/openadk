# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openobex
PKG_VERSION:=		1.5
PKG_RELEASE:=		1
PKG_BUILDDEP+=		bluez
PKG_MD5SUM:=		0d83dc86445a46a1b9750107ba7ab65c
PKG_DESCR:=		implementation of the Object Exchange (OBEX) protocol
PKG_SECTION:=		bluetooth
PKG_URL:=		http://dev.zuckschwerdt.org/openobex/wiki/WikiStart
PKG_SITES:=		${MASTER_SITE_KERNEL:=bluetooth/}

ifeq ($(ADK_STATIC),y)
PKG_OPTS:=		libonly
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENOBEX,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OPENOBEX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libopenobex.so* ${IDIR_OPENOBEX}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
