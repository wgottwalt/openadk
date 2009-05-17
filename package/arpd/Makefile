# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		arpd
PKG_VERSION:=		0.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		e2911fa9de1b92ef50deda1489ae944d
MASTER_SITES:=		http://niels.xtdnet.nl/honeyd/
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ARPD,arpd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--with-libdnet=${STAGING_DIR}/usr \
			--with-libevent=${STAGING_DIR}/usr \
			--with-libpcap=${STAGING_DIR}/usr
BUILD_STYLE=		auto
MAKE_FLAGS+=		CCOPT="${TARGET_CFLAGS}" \
			INCLS="-I. -I${STAGING_DIR}/usr/include" \
			LIBS="-L${STAGING_DIR}/usr/lib -lpcap -ldnet -levent"

post-install:
	${INSTALL_DIR} ${IDIR_ARPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/arpd ${IDIR_ARPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
