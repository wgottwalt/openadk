# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libtirpc
PKG_VERSION:=		0.1.11
PKG_RELEASE:=		2
PKG_MD5SUM:=		c656b7bf47e8bddbdefcd0b6a6f77b71
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=libtirpc/}
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBTIRPC,libtirpc,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	autotool gnu
ifneq (${ADK_COMPILE_NFS_UTILS_WITH_KERBEROS},y)
CONFIGURE_ARGS+=	--disable-gss
endif
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBTIRPC}/usr/lib ${IDIR_LIBTIRPC}/etc
	${CP} ${WRKINST}/usr/lib/libtirpc*.so* ${IDIR_LIBTIRPC}/usr/lib/
	${CP} ./files/netconfig ${IDIR_LIBTIRPC}/etc

include ${TOPDIR}/mk/pkg-bottom.mk
