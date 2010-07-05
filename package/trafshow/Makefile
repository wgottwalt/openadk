# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		trafshow
PKG_VERSION:=		5.2.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		0b2f0bb23b7832138b7d841437b9e182
PKG_DESCR:=		traffic analyzing tool
PKG_SECTION:=		net
PKG_SITES:=		http://www.sfr-fresh.com/linux/misc/

PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TRAFSHOW,trafshow,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-DHAVE_SOCKADDR_STORAGE -DHAVE_HAS_COLORS
TLDFLAGS+=		-pthread

post-install:
	${INSTALL_DIR} ${IDIR_TRAFSHOW}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/trafshow ${IDIR_TRAFSHOW}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
