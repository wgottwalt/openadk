# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		openntpd
PKG_VERSION:=		5.7p4
PKG_RELEASE:=		1
PKG_HASH:=		a993d95976e375acc0ab1a677fd268f55024477835633c8ae404895046bccb23
PKG_DESCR:=		ntp server daemon
PKG_SECTION:=		net/ntp
PKG_URL:=		http://www.openntpd.org/
PKG_SITES:=		ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENNTPD,openntpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

XAKE_FLAGS+=		GCC_HONOUR_COPTS=s
INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--with-privsep-user=ntp \
			--with-adjtimex

do-install:
	${INSTALL_DIR} ${IDIR_OPENNTPD}/etc
	${INSTALL_DATA} ./files/ntpd.conf ${IDIR_OPENNTPD}/etc
	${INSTALL_DIR} ${IDIR_OPENNTPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/ntpd ${IDIR_OPENNTPD}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
