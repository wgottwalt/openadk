# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ctorrent
PKG_VERSION:=		1.3.4-dnh2
PKG_RELEASE:=		2
PKG_MD5SUM:=		6635e2d0d0ee21faeb85d95cd93c137b
PKG_DESCR:=		console-based BitTorrent client
PKG_SECTION:=		net
PKG_URL:=		http://www.rahul.net/dholmes/ctorrent
PKG_SITES:=		http://www.rahul.net/dholmes/ctorrent/

WRKDIST=		${WRKDIR}/${PKG_NAME}-dnh2

ifeq ($(ADK_COMPILE_CTORRENT_WITH_UCLIBCXX),y)
PKG_DEPENDS:=            uclibc++
else
PKG_DEPENDS:=            libstdcxx
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CTORRENT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_CTORRENT_WITH_UCLIBCXX),y)
TCXXFLAGS+=		-fno-builtin -fno-rtti -nostdinc++
TLDFLAGS+=		-lgcc_s -luClibc++ -lc -lm -nodefaultlibs
endif

CONFIGURE_STYLE=	gnu
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_CTORRENT}
	${CP} ${WRKINST}/* ${IDIR_CTORRENT}/

include ${TOPDIR}/mk/pkg-bottom.mk
