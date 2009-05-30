# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		maradns
PKG_VERSION:=		1.0.41
PKG_RELEASE:=		1
PKG_MD5SUM:=		9abc13da25c1103d788ee9def1c8e764
PKG_DESCR:=		small and secure DNS server
PKG_SECTION:=		net
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.maradns.org
PKG_SITES:=		http://www.maradns.org/download/1.0/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MARADNS,maradns,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE:=		auto
MAKE_FLAGS+=		CFLAGS="${TCFLAGS}" \
			FLAGS="${TCFLAGS}" \
			CC="${TARGET_CC}" \
			HOSTCC="${HOSTCC}"
INSTALL_STYLE:=		auto
FAKE_FLAGS+=		PREFIX="${WRKINST}/usr" \
			RPM_BUILD_ROOT="${WRKINST}"

pre-install:
	mkdir -p ${WRKINST}/usr/{bin,sbin}
	mkdir -p ${WRKINST}/usr/man/man{1,5,8}

post-install:
	${INSTALL_DIR} ${IDIR_MARADNS}/etc/maradns
	${INSTALL_DIR} ${IDIR_MARADNS}/usr/bin ${IDIR_MARADNS}/usr/sbin
	${INSTALL_DATA} ./files/mararc ${IDIR_MARADNS}/etc/mararc
	${INSTALL_DATA} ./files/sample.{zone,ptr} ${IDIR_MARADNS}/etc/maradns/
	${CP} ${WRKINST}/usr/bin/{askmara,getzone} ${IDIR_MARADNS}/usr/bin/
	${CP} ${WRKINST}/usr/sbin/{maradns,zoneserver} ${IDIR_MARADNS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
