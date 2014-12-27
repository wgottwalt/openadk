# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		trafshow
PKG_VERSION:=		5.2.3
PKG_RELEASE:=		2
PKG_HASH:=		ea7e22674a66afcc7174779d0f803c1f25b42271973b4f75fab293b8d7db11fc
PKG_DESCR:=		traffic analyzing tool
PKG_SECTION:=		net/perf
PKG_BUILDDEP:=		libpcap ncurses
PKG_DEPENDS:=		libpcap libncurses libpthread
PKG_SITES:=		http://openadk.org/distfiles
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tgz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,TRAFSHOW,trafshow,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CPPFLAGS+=	-DHAVE_SOCKADDR_STORAGE -DHAVE_HAS_COLORS -D_GNU_SOURCE
TARGET_LDFLAGS+=	-ltinfo

trafshow-install:
	${INSTALL_DIR} ${IDIR_TRAFSHOW}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/trafshow ${IDIR_TRAFSHOW}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
