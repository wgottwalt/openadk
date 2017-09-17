# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		openntpd
PKG_VERSION:=		6.0p1
PKG_RELEASE:=		1
PKG_HASH:=		b1ab80094788912adb12b33cb1f251cc58db39294c1b5c6376972f5f7ba577e8
PKG_DESCR:=		ntp server daemon
PKG_SECTION:=		net/ntp
PKG_URL:=		http://www.openntpd.org/
PKG_SITES:=		http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/
PKG_BB:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENNTPD,openntpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--with-privsep-user=ntp

do-install:
	${INSTALL_DIR} ${IDIR_OPENNTPD}/etc
	${INSTALL_DATA} ./files/ntpd.conf ${IDIR_OPENNTPD}/etc
	${INSTALL_DIR} ${IDIR_OPENNTPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/src/ntpd ${IDIR_OPENNTPD}/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
