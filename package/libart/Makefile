# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		libart
PKG_VERSION:=		2.3.17
PKG_RELEASE:=		2
PKG_MD5SUM:=		f1f6b3e5490f382535dccb288f5d8b14
PKG_DESCR:=		high-performance 2d graphics library
PKG_SECTION:=		libs/image
PKG_SITES:=		${MASTER_SITE_GNOME:=libart_lgpl/2.3/}
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}_lgpl-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_lgpl-${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBART,libart,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

MAKE_ENV+=		HOSTCC=$(CC_FOR_BUILD)

libart-install:
	${INSTALL_DIR} ${IDIR_LIBART}/usr/lib
	${CP} ${WRKINST}/usr/lib/libart_lgpl_2.so* ${IDIR_LIBART}/usr/lib/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
