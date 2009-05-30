# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libnids
PKG_VERSION:=		1.18
PKG_RELEASE:=		1
PKG_MD5SUM:=		9ee6dcdfac97bae6fe611aa27d2594a5
PKG_DESCR:=		implementation of an E-component of Network Intrusion Detection System
PKG_SECTION:=		libs
PKG_SITES:=		http://www.packetfactory.net/projects/libnids/dist/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBNIDS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-libnet="${STAGING_DIR}/usr" \
			--with-libpcap="${STAGING_DIR}/usr"
XAKE_FLAGS+=		install_prefix="${WRKINST}"
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBNIDS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libnids.so.* ${IDIR_LIBNIDS}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
