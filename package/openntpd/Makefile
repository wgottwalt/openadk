# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openntpd
PKG_VERSION:=		3.9p1
PKG_RELEASE:=		18
PKG_MD5SUM:=		afc34175f38d08867c1403d9008600b3
PKG_DESCR:=		ntp server daemon
PKG_SECTION:=		net/ntp
PKG_DEPENDS:=		libopenssl
PKG_URL:=		http://www.openntpd.org/
PKG_SITES:=		ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENNTPD,openntpd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--with-privsep-user=ntp \
			--with-adjtimex

do-install:
	${INSTALL_DIR} ${IDIR_OPENNTPD}/etc
	${INSTALL_DATA} ./files/ntpd.conf ${IDIR_OPENNTPD}/etc/
	${INSTALL_DIR} ${IDIR_OPENNTPD}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/ntpd ${IDIR_OPENNTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
