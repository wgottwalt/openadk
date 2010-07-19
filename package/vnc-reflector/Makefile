# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		vnc-reflector
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c3f88bc62f228b335c25c07f9744ab0c
PKG_DESCR:=		specialized VNC server which acts as a proxy
PKG_SECTION:=		proxy
PKG_DEPENDS:=		libjpeg zlib
PKG_BUILDDEP+=		jpeg zlib
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=vnc-reflector/}

DISTFILES:=		vnc_reflector-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/vnc_reflector

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VNC_REFLECTOR,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TCPPFLAGS+=		-I.
TLDFLAGS+=		-lz -ljpeg
MAKE_FLAGS+=		CC="${TARGET_CC}" CFLAGS="${TCFLAGS} ${TCPPFLAGS} ${TLDFLAGS}"
ALL_TARGET:=		default

do-install:
	${INSTALL_DIR} ${IDIR_VNC_REFLECTOR}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/vncreflector ${IDIR_VNC_REFLECTOR}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
