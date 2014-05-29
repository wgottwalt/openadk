# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libavl
PKG_VERSION:=		0.3.5
PKG_RELEASE:=		2
PKG_MD5SUM:=		882c68ea7f71876ca110f3b84d7ab12d
PKG_DESCR:=		avl library
PKG_SECTION:=		libs/misc
PKG_SITES:=		http://openadk.org/distfiles/
PKG_OPTS:=		dev

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
WRKDIST=		$(WRKDIR)/avl-$(PKG_VERSION)

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBAVL,libavl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

MAKE_FILE:=		GNUmakefile
CONFIG_STYLE:=		manual
TARGET_CFLAGS+=		-fPIC

libavl-install:
	${INSTALL_DIR} ${IDIR_LIBAVL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libavl.so* ${IDIR_LIBAVL}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
