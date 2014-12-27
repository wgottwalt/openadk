# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vnc-reflector
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		2
PKG_HASH:=		9387082434a2176a01a20f64d0d35acd34dc1901e80db428689cc60ddbf49c53
PKG_DESCR:=		specialized vnc server which acts as a proxy
PKG_SECTION:=		net/proxy
PKG_DEPENDS:=		libjpeg-turbo zlib
PKG_BUILDDEP:=		libjpeg-turbo zlib
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=vnc-reflector/}

DISTFILES:=		vnc_reflector-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/vnc_reflector

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VNC_REFLECTOR,vnc-reflector,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_LDFLAGS+=	-lz -ljpeg

do-install:
	${INSTALL_DIR} ${IDIR_VNC_REFLECTOR}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/vncreflector ${IDIR_VNC_REFLECTOR}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
