# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openntpd
PKG_VERSION:=		3.9p1
PKG_RELEASE:=		17
PKG_MD5SUM:=		afc34175f38d08867c1403d9008600b3

MASTER_SITES:=		ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/ \
			ftp://ftp.de.openbsd.org/pub/unix/OpenBSD/OpenNTPD/ \
			ftp://ftp.fr.openbsd.org/pub/OpenBSD/OpenNTPD/ \
			ftp://ftp.sunet.se/pub/OpenBSD/OpenNTPD/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENNTPD,openntpd,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-privsep-user=ntp \
			--with-adjtimex
BUILD_STYLE:=		auto

do-install:
	${INSTALL_DIR} ${IDIR_OPENNTPD}/etc
	${INSTALL_DATA} ./files/ntpd.conf ${IDIR_OPENNTPD}/etc/
	${INSTALL_DIR} ${IDIR_OPENNTPD}/etc/init.d
	${INSTALL_DATA} ./files/ntpd.init ${IDIR_OPENNTPD}/etc/init.d/ntpd
	${INSTALL_DIR} ${IDIR_OPENNTPD}/usr/sbin/
	${INSTALL_BIN} ${WRKBUILD}/ntpd ${IDIR_OPENNTPD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
