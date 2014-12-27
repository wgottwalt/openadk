# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libavl
PKG_VERSION:=		0.3.5
PKG_RELEASE:=		2
PKG_HASH:=		4497b9e22cdd61ae2fa893b9d5fd6213dc306726d7c4be08c29e173622dca8a0
PKG_DESCR:=		avl library
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
WRKDIST=		$(WRKDIR)/avl-$(PKG_VERSION)

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAVL,libavl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

MAKE_FILE:=		GNUmakefile
CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-fPIC

libavl-install:
	${INSTALL_DIR} ${IDIR_LIBAVL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavl.so* ${IDIR_LIBAVL}/usr/lib

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
