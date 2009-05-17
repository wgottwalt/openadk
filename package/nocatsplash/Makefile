# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nocatsplash
PKG_VERSION:=		0.92
PKG_RELEASE:=		1
PKG_MD5SUM:=		e0fcc0effe52e63bc31070d16d0b4a81
MASTER_SITES:=		http://nocat.net/download/NoCatSplash/
DISTFILES:=		NoCatSplash-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/NoCatSplash-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NOCATSPLASH,nocatsplash,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-firewall=iptables \
			--with-glib-prefix="${STAGING_DIR}/usr"

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${CP} ${WRKINST}/* ${IDIR_NOCATSPLASH}/

include ${TOPDIR}/mk/pkg-bottom.mk
