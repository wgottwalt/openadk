# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		arpd
PKG_VERSION:=		0.2
PKG_RELEASE:=		3
PKG_MD5SUM:=		e2911fa9de1b92ef50deda1489ae944d
PKG_DESCR:=		generates arp responses for ip address ranges
PKG_SECTION:=		net/route
PKG_DEPENDS:=		libpcap libdnet libevent
PKG_BUILDDEP:=		libpcap libdnet libevent
PKG_URL:=		http://niels.xtdnet.nl/honeyd/
PKG_SITES:=		http://niels.xtdnet.nl/honeyd/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,ARPD,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-libdnet=${STAGING_TARGET_DIR}/usr \
			--with-libevent=${STAGING_TARGET_DIR}/usr \
			--with-libpcap=${STAGING_TARGET_DIR}/usr
MAKE_FLAGS+=		CFLAGS="${TARGET_CFLAGS}" \
			INCLS="-I. ${TARGET_CPPFLAGS}" \
			LIBS="-lpcap -ldnet -levent"

post-install:
	${INSTALL_DIR} ${IDIR_ARPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/arpd ${IDIR_ARPD}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
