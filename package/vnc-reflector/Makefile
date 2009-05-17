# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vnc-reflector
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c3f88bc62f228b335c25c07f9744ab0c
MASTER_SITES:=		${MASTER_SITE_SOURCEFORGE:=vnc-reflector/}
DISTFILES:=		vnc_reflector-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/vnc_reflector

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VNC_REFLECTOR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

BUILD_STYLE:=		auto
TCPPFLAGS+=		-I.
TLDFLAGS+=		-lz -ljpeg
MAKE_FLAGS+=		CC="${TARGET_CC}" CFLAGS="${TCFLAGS} ${TCPPFLAGS} ${TLDFLAGS}"
ALL_TARGET:=		default

do-install:
	${INSTALL_DIR} ${IDIR_VNC_REFLECTOR}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/vncreflector ${IDIR_VNC_REFLECTOR}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
