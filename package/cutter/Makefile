# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cutter
PKG_VERSION:=		1.03
PKG_RELEASE:=		2
PKG_HASH:=		4df4fac7c2208afafb279abb443005bf77d3dcf01af05fe1f2898213b9109615
PKG_DESCR:=		abort tcp/ip connections routed over a firewall
PKG_SECTION:=		net/firewall
PKG_URL:=		http://www.lowth.com/cutter/software/
PKG_SITES:=		http://openadk.org/distfiles/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CUTTER,cutter,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	${TARGET_CC} ${TARGET_CPPFLAGS} ${TARGET_CFLAGS} ${TARGET_LDFLAGS} \
		${WRKBUILD}/cutter.c -o ${WRKBUILD}/cutter

do-install:
	${INSTALL_DIR} ${IDIR_CUTTER}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/cutter ${IDIR_CUTTER}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
