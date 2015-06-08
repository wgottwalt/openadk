# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vnstat
PKG_VERSION:=		1.14
PKG_RELEASE:=		1
PKG_HASH:=		f8462a47d85d0890493dc9eaeafbc725ae631aa5b103fb7f8af4ddb2314e8386
PKG_DESCR:=		console-based network traffic monitor
PKG_SECTION:=		net/perf
PKG_SITES:=		http://humdi.net/vnstat/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VNSTAT,vnstat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual
ALL_TARGET:=		vnstat

do-install:
	${INSTALL_DIR} ${IDIR_VNSTAT}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/vnstat ${IDIR_VNSTAT}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
