# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		serdisplib
PKG_VERSION:=		1.97.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		52e4714d6a955c4d023a5ae52b2d36d8
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=serdisplib/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SERDISPLIB,serdisplib,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--enable-libusb
CONFIGURE_ENV+=		ac_cv_func_malloc_0_nonnull=yes
BUILD_STYLE:=		auto
TCFLAGS+=		${TCPPFLAGS}

do-install:
	${INSTALL_DIR} ${IDIR_SERDISPLIB}/usr/lib
	${CP} ${WRKBUILD}/lib/libserdisp.so.* ${IDIR_SERDISPLIB}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
