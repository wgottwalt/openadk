# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		vnstat
PKG_VERSION:=		1.4
PKG_RELEASE:=		1
PKG_HASH:=		2f63c326b34e92254552bd69772dcd8e24e9cc216ccfa182c9fa2523c37fcf37
PKG_DESCR:=		console-based network traffic monitor
PKG_SECTION:=		net/perf
PKG_SITES:=		http://humdi.net/vnstat/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,VNSTAT,vnstat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=          manual
INSTALL_STYLE:=         manual

MAKE_FLAGS+=		${TARGET_CONFIGURE_OPTS}
ALL_TARGET:=		vnstat

do-install:
	${INSTALL_DIR} ${IDIR_VNSTAT}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/src/vnstat ${IDIR_VNSTAT}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
