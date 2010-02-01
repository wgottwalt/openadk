# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		font-util
PKG_VERSION:=		1.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		171ebfd3733aeae3af91ad57d126d29d
PKG_DESCR:=		font util
PKG_SECTION:=		libs
PKG_URL:=		http://www.x.org/
PKG_SITES:=		${MASTER_SITE_XORG}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FONT_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CONFIGURE_STYLE:=	gnu
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_FONT_UTIL}/usr/share/fonts/X11/util
	${CP} ${WRKINST}/usr/share/fonts/X11/util/* \
		${IDIR_FONT_UTIL}/usr/share/fonts/X11/util

include ${TOPDIR}/mk/pkg-bottom.mk
